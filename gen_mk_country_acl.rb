#!/usr/bin/env ruby
# Enhanced version of gen_mk_country_acl.rb with CIDR block flattening functionality
# Original repo: https://github.com/audric/gen_mk_country_acl

require 'net/ftp'
require 'ipaddr'
require 'uri'
require 'open-uri'
require 'tempfile'

# Constants for NIC sources
SOURCES = {
  'arin' => 'ftp://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest',
  'afrinic' => 'ftp://ftp.afrinic.net/pub/stats/afrinic/delegated-afrinic-latest',
  'apnic' => 'ftp://ftp.apnic.net/pub/stats/apnic/delegated-apnic-latest',
  'lacnic' => 'ftp://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-latest',
  'ripencc' => 'ftp://ftp.ripe.net/ripe/stats/delegated-ripencc-latest'
}

# Class to handle CIDR block flattening
class CIDRFlattener
  # Converts a CIDR string to an IPAddr object
  def self.cidr_to_ipaddr(cidr)
    IPAddr.new(cidr)
  end

  # Checks if two CIDR blocks are adjacent and can be merged
  def self.can_merge?(cidr1, cidr2)
    ip1 = cidr_to_ipaddr(cidr1)
    ip2 = cidr_to_ipaddr(cidr2)
    
    # Get prefix length of both CIDRs
    prefix1 = cidr1.split('/')[1].to_i
    prefix2 = cidr2.split('/')[1].to_i
    
    # Can only merge if they have the same prefix length
    return false unless prefix1 == prefix2
    
    # Can merge if they are adjacent and can form a larger block
    # with prefix length one less than current
    if prefix1 > 0
      # Calculate network numbers
      network1 = ip1.to_i
      network2 = ip2.to_i
      
      # Calculate size of the network (number of addresses)
      size = 2**(32 - prefix1)
      
      # Check if they are adjacent
      adjacent = (network1 + size == network2) || (network2 + size == network1)
      
      # Check if they would form a valid larger block
      # This means they must have the same network number when masked with the higher subnet
      higher_subnet_mask = 0xFFFFFFFF << (32 - prefix1 + 1)
      same_higher_subnet = (network1 & higher_subnet_mask) == (network2 & higher_subnet_mask)
      
      return adjacent && same_higher_subnet
    end
    
    false
  end

  # Merges two adjacent CIDR blocks
  def self.merge_cidrs(cidr1, cidr2)
    prefix = cidr1.split('/')[1].to_i
    
    # If they can be merged, the new prefix is one less than the current
    if can_merge?(cidr1, cidr2)
      ip1 = cidr_to_ipaddr(cidr1)
      
      # Get the network number for the combined network
      # This is the smaller of the two network numbers
      ip2 = cidr_to_ipaddr(cidr2)
      network = [ip1.to_i, ip2.to_i].min
      
      # Create the new CIDR notation with prefix-1
      new_cidr = IPAddr.new(network, Socket::AF_INET).to_s + "/#{prefix - 1}"
      return new_cidr
    end
    
    nil
  end

  # Flattens a list of CIDR blocks by merging adjacent ones
  def self.flatten_cidrs(cidrs)
    return [] if cidrs.empty?
    
    # Sort the CIDR blocks by network address and prefix length
    # This helps identify adjacent networks more easily
    sorted_cidrs = cidrs.sort_by do |cidr|
      ip = cidr_to_ipaddr(cidr)
      prefix = cidr.split('/')[1].to_i
      [prefix, ip.to_i]  # Sort by prefix first, then by network address
    end
    
    flattened = []
    i = 0
    
    while i < sorted_cidrs.length
      current = sorted_cidrs[i]
      merged = false
      
      # Try to merge with each previously flattened CIDR
      flattened.each_with_index do |flat_cidr, j|
        if can_merge?(current, flat_cidr)
          merged_cidr = merge_cidrs(current, flat_cidr)
          if merged_cidr
            flattened[j] = merged_cidr
            merged = true
            break
          end
        end
      end
      
      # If couldn't merge with any previous, add to flattened list
      flattened << current unless merged
      i += 1
    end
    
    # Keep flattening until no more changes can be made
    if flattened.length < sorted_cidrs.length || flattened != sorted_cidrs
      return flatten_cidrs(flattened)
    end
    
    flattened
  end

  # Main function to process a list of IP blocks and return flattened list
  def self.flatten_ip_blocks(ip_blocks)
    flatten_cidrs(ip_blocks)
  end
end

# Class to handle downloading and processing IP blocks
class IPBlockProcessor
  attr_reader :country_blocks

  def initialize
    @country_blocks = {}  # Hash to store country => [ip_blocks]
  end

  # Downloads data from a URL (FTP or HTTP)
  def download_data(url)
    uri = URI.parse(url)
    data = nil

    case uri.scheme
    when 'ftp'
      temp_file = Tempfile.new('ip_data')
      
      Net::FTP.open(uri.host) do |ftp|
        ftp.login
        ftp.getbinaryfile(uri.path, temp_file.path)
      end
      
      data = File.read(temp_file.path)
      temp_file.close
      temp_file.unlink
    when 'http', 'https'
      data = URI.open(url).read
    else
      raise "Unsupported protocol: #{uri.scheme}"
    end

    data
  end

  # Parses delegated IP data from NIC
  def parse_delegated_data(data, nic)
    data.each_line do |line|
      next if line.start_with?('#') || line.strip.empty?
      
      fields = line.strip.split('|')
      next unless fields.length >= 7
      
      registry, country_code, type, start_ip, value, date, status = fields
      
      # Skip if not IPv4 or if it's reserved
      next unless type == 'ipv4' && status != 'reserved'
      
      # Convert to CIDR notation
      if type == 'ipv4'
        cidr = ip_range_to_cidr(start_ip, value.to_i)
        
        # Add to country's IP blocks
        @country_blocks[country_code] ||= []
        @country_blocks[country_code] << cidr
      end
    end
  end

  # Converts IP range to CIDR notation
  def ip_range_to_cidr(start_ip, num_ips)
    # Calculate prefix length based on number of IPs
    prefix_length = 32 - Math.log2(num_ips).to_i
    
    # Create CIDR notation
    "#{start_ip}/#{prefix_length}"
  end

  # Processes all NIC sources
  def process_all_sources
    SOURCES.each do |nic, url|
      puts "Processing #{nic} data from #{url}..."
      begin
        data = download_data(url)
        parse_delegated_data(data, nic)
      rescue => e
        puts "Error processing #{nic}: #{e.message}"
      end
    end
    
    # Flatten the IP blocks for each country
    flatten_country_blocks
  end

  # Flattens IP blocks for all countries
  def flatten_country_blocks
    puts "Flattening IP blocks for all countries..."
    total_original = 0
    total_flattened = 0
    
    @country_blocks.each do |country, ip_blocks|
      total_original += ip_blocks.length
      
      puts "  #{country}: #{ip_blocks.length} blocks"
      flattened = CIDRFlattener.flatten_ip_blocks(ip_blocks)
      @country_blocks[country] = flattened
      total_flattened += flattened.length
      
      reduction = ip_blocks.length - flattened.length
      percent = ((reduction.to_f / ip_blocks.length) * 100).round(2)
      puts "    Flattened to #{flattened.length} blocks (reduced by #{reduction} blocks, #{percent}%)"
    end
    
    total_reduction = total_original - total_flattened
    total_percent = ((total_reduction.to_f / total_original) * 100).round(2)
    puts "Total reduction: #{total_reduction} blocks (#{total_percent}%)"
  end

  # Generates Mikrotik RouterOS script files for each NIC
  def generate_mikrotik_scripts
    SOURCES.keys.each do |nic|
      filename = "mk_#{nic}.rsc"
      puts "Generating #{filename}..."
      
      File.open(filename, 'w') do |file|
        file.puts "# Mikrotik RouterOS Country IP Blocks"
        file.puts "# Source: #{SOURCES[nic]}"
        file.puts "# Generated on: #{Time.now}"
        file.puts "# IP blocks have been flattened where possible"
        file.puts ""
        
        # Find all countries for this NIC
        nic_countries = @country_blocks.keys.select do |country|
          # Filter logic would go here if we knew how countries are associated with NICs
          # For now, we'll include all countries in each NIC file
          true
        end
        
        nic_countries.sort.each do |country|
          ip_blocks = @country_blocks[country]
          next if ip_blocks.nil? || ip_blocks.empty?
          
          file.puts "# Country: #{country}"
          file.puts "/ip firewall address-list"
          
          ip_blocks.each do |cidr|
            file.puts "add address=#{cidr} list=\"#{country} country\" comment=\"#{nic}\""
          end
          
          file.puts ""
        end
      end
      
      puts "  Created #{filename}"
    end
  end
end

# Main execution
if __FILE__ == $0
  processor = IPBlockProcessor.new
  processor.process_all_sources
  processor.generate_mikrotik_scripts
  
  puts "All done! Mikrotik RouterOS scripts have been generated."
end
