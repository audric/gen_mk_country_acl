#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'net/ftp'
require 'net/http'
require 'uri'
require 'ipaddr'
require 'fileutils'

class MikrotikCountryACLGenerator
  # NIC sources with their FTP URLs
  NICS = {
    'arin' => 'https://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest',
    'afrinic' => 'ftp://ftp.afrinic.net/pub/stats/afrinic/delegated-afrinic-latest',
    'apnic' => 'ftp://ftp.apnic.net/pub/stats/apnic/delegated-apnic-latest',
    'lacnic' => 'ftp://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-latest',
    'ripencc' => 'ftp://ftp.ripe.net/ripe/stats/delegated-ripencc-latest'
  }

  def initialize
    @download_dir = 'nic_downloads'
    @combined_file = 'combined_delegations.txt'
    @combined_optimized_file = 'combined_delegations_optimized.txt'
    @countries_dir = 'countries'
    
    # Create directories
    FileUtils.mkdir_p(@download_dir)
    FileUtils.mkdir_p(@countries_dir)
    
    puts "=== Mikrotik Country ACL Generator ==="
    puts "Downloads NIC files, combines them, optimizes CIDR blocks, and generates country-specific .rsc files"
    puts
  end

  def run
    # Step 1: Download all NIC files and keep them
    download_nic_files
    
    # Step 2: Combine all files into a single file
    combine_files
    
    # Step 3: Flatten/optimize adjoining CIDR blocks
    optimize_cidr_blocks
    
    # Step 4: Extract country-specific .rsc files
    extract_country_files
    
    puts "\n=== Generation Complete ==="
    puts "Original NIC files preserved in: #{@download_dir}/"
    puts "Combined file: #{@combined_file}"
    puts "Optimized file: #{@combined_optimized_file}"
    puts "Country .rsc files: #{@countries_dir}/"
  end

  private

  def download_nic_files
    puts "Step 1: Downloading NIC files..."
    
    NICS.each do |nic_name, url|
      local_file = File.join(@download_dir, "#{nic_name}_delegated.txt")
      
      if File.exist?(local_file) && File.mtime(local_file) > Time.now - 86400
        puts "  #{nic_name}: Using cached file (less than 24h old)"
        next
      end
      
      puts "  #{nic_name}: Downloading from #{url}"
      
      begin
        uri = URI.parse(url)
        
        if uri.scheme == 'ftp'
          download_ftp_file(uri, local_file)
        else
          download_http_file(uri, local_file)
        end
        
        puts "    Saved to: #{local_file}"
      rescue => e
        puts "    ERROR downloading #{nic_name}: #{e.message}"
        raise
      end
    end
  end

  def download_ftp_file(uri, local_file)
    Net::FTP.open(uri.host) do |ftp|
      ftp.login
      ftp.getbinaryfile(uri.path, local_file)
    end
  end

  def download_http_file(uri, local_file)
    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      response = http.get(uri.path)
      File.open(local_file, 'wb') { |f| f.write(response.body) }
    end
  end

  def combine_files
    puts "\nStep 2: Combining all NIC files..."
    
    File.open(@combined_file, 'w') do |combined|
      combined.puts "# Combined delegation files from all NICs"
      combined.puts "# Generated at: #{Time.now}"
      combined.puts "# Sources: #{NICS.keys.join(', ')}"
      combined.puts ""
      
      NICS.each do |nic_name, _|
        local_file = File.join(@download_dir, "#{nic_name}_delegated.txt")
        
        if File.exist?(local_file)
          puts "  Adding #{nic_name} data..."
          combined.puts "# --- #{nic_name.upcase} ---"
          
          File.foreach(local_file) do |line|
            combined.puts line
          end
          
          combined.puts ""
        else
          puts "  WARNING: #{local_file} not found, skipping"
        end
      end
    end
    
    puts "  Combined file created: #{@combined_file}"
  end

  def optimize_cidr_blocks
    puts "\nStep 3: Optimizing CIDR blocks..."
    
    # Parse all delegations and group by country
    country_blocks = {}
    total_lines = 0
    processed_lines = 0
    
    File.foreach(@combined_file) do |line|
      total_lines += 1
      next if line.start_with?('#') || line.strip.empty?
      
      fields = line.strip.split('|')
      next unless fields.length >= 7
      next unless fields[2] == 'ipv4'
      next unless fields[6] == 'assigned' || fields[6] == 'allocated'
      
      nic = fields[0]
      country = fields[1]
      type = fields[2]
      start_ip = fields[3]
      count = fields[4].to_i
      
      next if country == '*' || country.empty?
      
      begin
        # Convert count to CIDR notation
        cidrs = count_to_cidrs(start_ip, count)
        
        country_blocks[country] ||= []
        country_blocks[country].concat(cidrs)
        
        processed_lines += 1
      rescue => e
        puts "    Warning: Error processing line #{total_lines}: #{e.message}"
      end
    end
    
    puts "  Processed #{processed_lines} of #{total_lines} lines"
    puts "  Found #{country_blocks.keys.length} countries"
    
    # Optimize each country's blocks
    File.open(@combined_optimized_file, 'w') do |opt_file|
      opt_file.puts "# Optimized delegation file with flattened CIDR blocks"
      opt_file.puts "# Generated at: #{Time.now}"
      opt_file.puts "# Countries: #{country_blocks.keys.sort.join(', ')}"
      opt_file.puts ""
      
      country_blocks.each do |country, blocks|
        puts "  Optimizing #{country}: #{blocks.length} blocks"
        
        # Sort and merge overlapping/adjacent blocks
        optimized = optimize_cidr_list(blocks)
        
        puts "    Reduced to #{optimized.length} blocks (#{((1.0 - optimized.length.to_f/blocks.length) * 100).round(1)}% reduction)"
        
        opt_file.puts "# #{country}: #{optimized.length} blocks (was #{blocks.length})"
        optimized.each do |cidr|
          opt_file.puts "#{country}|#{cidr}"
        end
        opt_file.puts ""
      end
    end
    
    puts "  Optimized file created: #{@combined_optimized_file}"
  end

  def count_to_cidrs(start_ip, count)
    # Convert IP count allocation to CIDR blocks
    start_addr = IPAddr.new(start_ip)
    cidrs = []
    
    remaining = count
    current_ip = start_addr.to_i
    
    while remaining > 0
      # Find the largest power of 2 that fits
      max_block_size = 1
      while max_block_size * 2 <= remaining && (current_ip & (max_block_size * 2 - 1)) == 0
        max_block_size *= 2
      end
      
      # Calculate prefix length
      prefix_len = 32 - Math.log2(max_block_size).to_i
      
      cidr = IPAddr.new(current_ip, Socket::AF_INET).to_s + "/#{prefix_len}"
      cidrs << cidr
      
      current_ip += max_block_size
      remaining -= max_block_size
    end
    
    cidrs
  end

  def optimize_cidr_list(cidrs)
    # Convert CIDR strings to IPAddr objects with their ranges
    ranges = cidrs.map do |cidr|
      ip_addr = IPAddr.new(cidr)
      {
        start: ip_addr.to_range.first.to_i,
        end: ip_addr.to_range.last.to_i,
        cidr: ip_addr
      }
    end
    
    # Sort by start IP
    ranges.sort_by! { |r| r[:start] }
    
    # Merge overlapping and adjacent ranges
    merged = []
    current = ranges.first
    
    ranges[1..-1].each do |range|
      if range[:start] <= current[:end] + 1
        # Overlapping or adjacent - merge
        current[:end] = [current[:end], range[:end]].max
      else
        # Not adjacent - add current to merged and start new
        merged << current
        current = range
      end
    end
    merged << current if current
    
    # Convert back to CIDR notation
    merged.map do |range|
      range_to_cidrs(range[:start], range[:end])
    end.flatten
  end

  def range_to_cidrs(start_ip, end_ip)
    cidrs = []
    current = start_ip
    
    while current <= end_ip
      # Find the largest block that fits
      max_size = end_ip - current + 1
      block_size = 1
      
      # Find largest power of 2 that fits and is aligned
      while block_size * 2 <= max_size && (current & (block_size * 2 - 1)) == 0
        block_size *= 2
      end
      
      prefix_len = 32 - Math.log2(block_size).to_i
      cidr = IPAddr.new(current, Socket::AF_INET).to_s + "/#{prefix_len}"
      cidrs << cidr
      
      current += block_size
    end
    
    cidrs
  end

  def extract_country_files
    puts "\nStep 4: Extracting country-specific .rsc files..."
    
    countries = {}
    
    # Read optimized file and group by country
    File.foreach(@combined_optimized_file) do |line|
      next if line.start_with?('#') || line.strip.empty?
      
      parts = line.strip.split('|')
      next unless parts.length == 2
      
      country = parts[0]
      cidr = parts[1]
      
      countries[country] ||= []
      countries[country] << cidr
    end
    
    puts "  Generating .rsc files for #{countries.keys.length} countries..."
    
    countries.each do |country, cidrs|
      rsc_file = File.join(@countries_dir, "#{country.downcase}.rsc")
      
      File.open(rsc_file, 'w') do |f|
        f.puts "# MikroTik RouterOS address list for #{country}"
        f.puts "# Generated at: #{Time.now}"
        f.puts "# Total CIDR blocks: #{cidrs.length}"
        f.puts ""
        f.puts "/ip firewall address-list"
        
        cidrs.each do |cidr|
          f.puts "add list=\"#{country} country\" address=#{cidr} comment=\"#{country}\""
        end
        
        f.puts ""
        f.puts "# Usage examples:"
        f.puts "# /ip firewall filter"
        f.puts "# add action=drop chain=input src-address-list=\"#{country} country\" log=yes"
        f.puts "# add action=drop chain=forward src-address-list=\"#{country} country\" log=yes"
      end
      
      puts "    #{country}: #{cidrs.length} blocks -> #{rsc_file}"
    end
    
    # Create a summary file
    summary_file = File.join(@countries_dir, '_summary.txt')
    File.open(summary_file, 'w') do |f|
      f.puts "Country IP Block Summary"
      f.puts "Generated at: #{Time.now}"
      f.puts "=" * 50
      f.puts
      
      countries.sort.each do |country, cidrs|
        f.puts "#{country}: #{cidrs.length} blocks"
      end
      
      f.puts
      f.puts "Total countries: #{countries.keys.length}"
      f.puts "Total CIDR blocks: #{countries.values.map(&:length).sum}"
    end
    
    puts "  Summary written to: #{summary_file}"
  end
end

# Run the generator
if __FILE__ == $0
  begin
    generator = MikrotikCountryACLGenerator.new
    generator.run
  rescue => e
    puts "ERROR: #{e.message}"
    puts e.backtrace if ENV['DEBUG']
    exit 1
  end
end
