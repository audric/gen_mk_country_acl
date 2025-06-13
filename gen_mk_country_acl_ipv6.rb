#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# -----------------------------------------------------------------------------
#  gen_mk_country_acl_ipv6.rb  –  Generate MikroTik RouterOS address‑list rules
#                                for **IPv6** country blocks
#
#  Companion to the original IPv4 script.  Workflow:
#    1. Fetch the latest delegated‑stats files (all five RIRs)
#    2. Concatenate & cache
#    3. Merge overlapping/adjacent prefixes per country
#    4. Emit .rsc files one per country + _summary.txt
#
#  Differences vs IPv4 version
#  · We parse only lines whose third field is "ipv6" – the length column is the
#    CIDR prefix‑length already, so no host‑count explosion is needed.
#  · Arithmetic is 128‑bit but Ruby handles it transparently.
#  · Fewer prefixes overall ⇒ usually faster than IPv4 run.
# -----------------------------------------------------------------------------

require 'net/ftp'
require 'net/http'
require 'uri'
require 'ipaddr'
require 'fileutils'

class MikrotikCountryACLGeneratorIPv6
  # RIR data sources -----------------------------------------------------------
  NICS = {
    'arin'     => 'https://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest',
    'afrinic'  => 'ftp://ftp.afrinic.net/pub/stats/afrinic/delegated-afrinic-latest',
    'apnic'    => 'ftp://ftp.apnic.net/pub/stats/apnic/delegated-apnic-latest',
    'lacnic'   => 'ftp://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-latest',
    'ripencc'  => 'ftp://ftp.ripe.net/ripe/stats/delegated-ripencc-latest'
  }

  def initialize
    @download_dir            = 'nic_downloads_v6'
    @combined_file           = 'combined_delegations_v6.txt'
    @combined_optimised_file = 'combined_delegations_v6_optimised.txt'
    @countries_dir           = 'countries_v6'

    FileUtils.mkdir_p @download_dir
    FileUtils.mkdir_p @countries_dir

    puts "=== MikroTik Country ACL Generator – IPv6 ==="
  end

  # ---------------------------------------------------------------------------
  # Pipeline entry‑point -------------------------------------------------------
  # ---------------------------------------------------------------------------
  def run
    download_nic_files
    combine_files
    optimise_cidr_blocks
    extract_country_files
    puts "\n✓ All done. Import the desired .rsc on your RouterOS box.";
  end

  # ---------------------------------------------------------------------------
  # 1. Fetch RIR files (cache for 24 h) ---------------------------------------
  # ---------------------------------------------------------------------------
  def download_nic_files
    puts "\nStep 1 ▸ Downloading RIR files …"
    NICS.each do |nic, url|
      local = File.join(@download_dir, "#{nic}_delegated.txt")
      if File.exist?(local) && File.mtime(local) > Time.now - 86_400
        puts "  #{nic.ljust(7)} – cached copy fresh ↩︎"
        next
      end

      puts "  #{nic.ljust(7)} – fetching #{url}"
      begin
        uri = URI(url)
        if uri.scheme == 'ftp'
          Net::FTP.open(uri.host) { |ftp| ftp.login; ftp.getbinaryfile(uri.path, local) }
        else
          Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |h|
            resp = h.get(uri.path)
            raise "HTTP #{resp.code}" unless resp.is_a?(Net::HTTPSuccess)
            File.binwrite(local, resp.body)
          end
        end
        puts "    ↳ saved to #{local}"
      rescue => e
        warn "    ⚠ #{nic}: #{e.message}"
      end
    end
  end

  # ---------------------------------------------------------------------------
  # 2. Concatenate for single‑pass parsing ------------------------------------
  # ---------------------------------------------------------------------------
  def combine_files
    puts "\nStep 2 ▸ Combining files …"
    File.open(@combined_file, 'w') do |out|
      out.puts "# Combined delegation files (IPv6) – #{Time.now}"
      NICS.keys.each do |nic|
        path = File.join(@download_dir, "#{nic}_delegated.txt")
        next unless File.exist?(path)
        out.puts "# ---- #{nic.upcase} ----"
        File.foreach(path) { |l| out.puts l }
      end
    end
    puts "  ↳ #{@combined_file} ready"
  end

  # ---------------------------------------------------------------------------
  # 3. Parse & merge -----------------------------------------------------------
  # ---------------------------------------------------------------------------
  def optimise_cidr_blocks
    puts "\nStep 3 ▸ Parsing & merging …"

    per_cc = Hash.new { |h, k| h[k] = [] }
    total_lines = 0
    ipv6_lines  = 0

    File.foreach(@combined_file) do |line|
      total_lines += 1
      next if line.start_with?('#')
      reg, cc, type, start, value, _date, status, * = line.strip.split('|')
      next unless type == 'ipv6' && %w[allocated assigned].include?(status)
      ipv6_lines += 1
      cidr = "#{start}/#{value}"
      per_cc[cc] << cidr
    end

    puts "  parsed #{ipv6_lines} IPv6 rows out of #{total_lines} lines"

    File.open(@combined_optimised_file, 'w') do |out|
      out.puts "# Optimised IPv6 delegation list – #{Time.now}"
      per_cc.sort.each do |cc, list|
        merged = merge_cidrs(list, 128)
        out.puts "# #{cc} – #{merged.size} prefixes (was #{list.size})"
        merged.each { |c| out.puts "#{cc}|#{c}" }
        per_cc[cc] = merged # replace with merged list for next phase
      end
    end
    puts "  ↳ #{@combined_optimised_file} ready"
  end

  # --- range merge helpers ----------------------------------------------------
  def merge_cidrs(cidrs, bits)
    ranges = cidrs.map { |c| ip = IPAddr.new(c); { s: ip.to_range.first.to_i, e: ip.to_range.last.to_i } }
                 .sort_by { |r| r[:s] }

    merged = []
    cur    = ranges.shift
    ranges.each do |r|
      if r[:s] <= cur[:e] + 1
        cur[:e] = [cur[:e], r[:e]].max
      else
        merged << cur
        cur = r
      end
    end
    merged << cur if cur
    merged.flat_map { |r| range_to_cidrs(r[:s], r[:e], bits) }
  end

  def range_to_cidrs(start_i, end_i, bits)
    cidrs = []
    cur   = start_i
    while cur <= end_i
      max_len   = end_i - cur + 1
      block_len = 1
      while (block_len << 1) <= max_len && (cur & (block_len - 1)).zero?
        block_len <<= 1
      end
      prefix = bits - Math.log2(block_len).to_i
      fam    = bits == 32 ? Socket::AF_INET : Socket::AF_INET6
      cidrs << "#{IPAddr.new(cur, fam)}/#{prefix}"
      cur += block_len
    end
    cidrs
  end

  # ---------------------------------------------------------------------------
  # 4. Emit RouterOS scripts & summary ----------------------------------------
  # ---------------------------------------------------------------------------
  def extract_country_files
    puts "\nStep 4 ▸ Writing .rsc files …"

    per_cc = Hash.new { |h, k| h[k] = [] }
    File.foreach(@combined_optimised_file) do |line|
      next if line.start_with?('#')
      cc, cidr = line.strip.split('|', 2)
      per_cc[cc] << cidr
    end

    total_blocks = 0

    per_cc.each do |cc, cidrs|
      total_blocks += cidrs.size
      outfile = File.join(@countries_dir, "#{cc.downcase}.rsc")
      File.open(outfile, 'w') do |f|
        f.puts "# MikroTik IPv6 address‑list for #{cc}"
        f.puts "# Generated #{Time.now} – #{cidrs.size} prefixes"
        f.puts "/ipv6 firewall address-list"
        cidrs.each { |c| f.puts "add list=\"#{cc} IPv6\" address=#{c} comment=\"#{cc}\"" }
      end
      puts "  #{cc} → #{cidrs.size} prefixes"
    end

    # human‑readable summary ---------------------------------------------------
    File.open(File.join(@countries_dir, '_summary.txt'), 'w') do |f|
      f.puts "Country | IPv6 prefixes"
      f.puts "=" * 32
      per_cc.sort.each { |cc, arr| f.puts "#{cc.ljust(3)} | #{arr.size}" }
      f.puts
      f.puts "Total countries     : #{per_cc.size}"
      f.puts "Total IPv6 prefixes : #{total_blocks}"
      f.puts "Generated           : #{Time.now}"
    end
    puts "  _summary.txt written (#{per_cc.size} countries, #{total_blocks} prefixes)"
  end
end

# -----------------------------------------------------------------------------
# CLI wrapper ------------------------------------------------------------------
# -----------------------------------------------------------------------------
if __FILE__ == $0
  begin
    MikrotikCountryACLGeneratorIPv6.new.run
  rescue Interrupt
    puts "\nAborted by user."
  rescue => e
    warn "ERROR: #{e.message}"
    warn e.backtrace.join("\n") if ENV['DEBUG']
    exit 1
  end
end
