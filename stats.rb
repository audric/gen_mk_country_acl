#!/usr/bin/env ruby
# Statistics calculator for gen_mk_country_acl
# Calculates statistics about NICs, countries, IP blocks, and flattening efficiency

require 'json'
require 'fileutils'
require 'ipaddr'
require 'optparse'

class IPBlockStats
  attr_reader :stats

  def initialize(options = {})
    @options = {
      input_dir: '.',
      countries_dir: 'countries',
      cache_dir: '.cache',
      output_file: 'ip_stats.json',
      verbose: false,
      debug: false
    }.merge(options)
    
    @stats = {
      nics: {},
      countries: {},
      totals: {
        nics: 0,
        countries: 0,
        ip_blocks: 0,
        ip_addresses: 0,
        original_blocks: 0,
        flattened_blocks: 0
      }
    }
  end
  
  # Calculate the number of IP addresses in a CIDR block
  def ip_count(cidr)
    ip = IPAddr.new(cidr)
    prefix = cidr.split('/')[1].to_i
    2**(32 - prefix)
  end
  
  # Parse a Mikrotik RouterOS script file to extract IP blocks
  def parse_mikrotik_file(file_path, nic_name = nil)
    current_country = nil
    blocks = {}
    
    puts "  Reading file: #{file_path}" if @options[:debug]
    
    File.readlines(file_path).each do |line|
      # Check for country line
      if line.start_with?("# Country: ")
        current_country = line.sub("# Country: ", "").strip
        blocks[current_country] ||= []
      # Check for IP address line
      elsif line.match?(/add address=([0-9\.\/]+)/) && current_country
        cidr = line.match(/add address=([0-9\.\/]+)/)[1]
        blocks[current_country] << cidr
      end
    end
    
    if @options[:debug]
      puts "  Found #{blocks.keys.size} countries in #{nic_name}:"
      blocks.keys.sort.each do |country|
        puts "    #{country}: #{blocks[country].size} blocks"
      end
    end
    
    blocks
  end
  
  # Analyze cached original (unflattened) blocks if available
  def analyze_original_blocks
    cache_file = File.join(@options[:cache_dir], "country_blocks.json")
    return unless File.exist?(cache_file)
    
    puts "Analyzing original (unflattened) blocks from cache..." if @options[:verbose]
    
    begin
      original_blocks = JSON.parse(File.read(cache_file))
      
      total_original_blocks = 0
      
      original_blocks.each do |country, blocks|
        country_block_count = blocks.length
        total_original_blocks += country_block_count
        
        if @stats[:countries][country]
          @stats[:countries][country][:original_blocks] = country_block_count
          
          # Verify that flattening is actually reducing block count
          flattened_count = @stats[:countries][country][:blocks]
          if flattened_count > country_block_count
            puts "Warning: Country #{country} has more flattened blocks (#{flattened_count}) than original blocks (#{country_block_count})" if @options[:verbose]
          end
        end
      end
      
      @stats[:totals][:original_blocks] = total_original_blocks
      
      # Verify that overall flattening is reducing block count
      if @stats[:totals][:flattened_blocks] > total_original_blocks
        puts "Warning: Total flattened blocks (#{@stats[:totals][:flattened_blocks]}) is greater than total original blocks (#{total_original_blocks})" if @options[:verbose]
      end
      
      puts "Found #{format_number(total_original_blocks)} original blocks in cache" if @options[:verbose]
    rescue => e
      puts "Error analyzing original blocks: #{e.message}" if @options[:verbose]
    end
  end
  
  # Verify the statistics for consistency
  def verify_statistics
    puts "\nVerifying statistics consistency..." if @options[:verbose]
    
    issues = []
    
    # Verify total countries matches the count of countries
    if @stats[:totals][:countries] != @stats[:countries].size
      issues << "Total countries (#{@stats[:totals][:countries]}) doesn't match actual count (#{@stats[:countries].size})"
    end
    
    # Verify NIC country counts
    nic_countries = {}
    @stats[:countries].each do |country, data|
      data[:nics].each do |nic|
        nic_countries[nic] ||= []
        nic_countries[nic] << country
      end
    end
    
    nic_countries.each do |nic, countries|
      if @stats[:nics][nic][:countries] != countries.size
        issues << "NIC #{nic} countries (#{@stats[:nics][nic][:countries]}) doesn't match actual count (#{countries.size})"
      end
    end
    
    # Verify total blocks matches sum of country blocks
    total_country_blocks = @stats[:countries].sum { |_, data| data[:blocks] }
    if total_country_blocks != @stats[:totals][:flattened_blocks]
      issues << "Total flattened blocks (#{@stats[:totals][:flattened_blocks]}) doesn't match sum of country blocks (#{total_country_blocks})"
    end
    
    # Verify total IPs matches sum of country IPs
    total_country_ips = @stats[:countries].sum { |_, data| data[:ip_addresses] }
    if total_country_ips != @stats[:totals][:ip_addresses]
      issues << "Total IP addresses (#{@stats[:totals][:ip_addresses]}) doesn't match sum of country IPs (#{total_country_ips})"
    end
    
    # Verify NIC block counts
    nic_block_totals = {}
    @stats[:countries].each do |country, data|
      data[:nic_blocks].each do |nic, count|
        nic_block_totals[nic] ||= 0
        nic_block_totals[nic] += count
      end
    end
    
    nic_block_totals.each do |nic, total|
      if @stats[:nics][nic][:blocks] != total
        issues << "NIC #{nic} blocks (#{@stats[:nics][nic][:blocks]}) doesn't match sum of country blocks for this NIC (#{total})"
      end
    end
    
    # Report any issues found
    if issues.empty?
      puts "Statistics verified successfully" if @options[:verbose]
    else
      puts "\nWarning: Inconsistencies found in statistics:"
      issues.each do |issue|
        puts "  - #{issue}"
      end
    end
    
    @stats[:verification] = {
      issues: issues,
      verified: issues.empty?
    }
  end
  
  # Format time in a human-readable way
  def format_time(seconds)
    if seconds < 60
      "#{seconds.round(1)}s"
    elsif seconds < 3600
      "#{(seconds / 60).floor}m #{(seconds % 60).round}s"
    else
      "#{(seconds / 3600).floor}h #{((seconds % 3600) / 60).floor}m #{(seconds % 60).round}s"
    end
  end

  # Format large numbers with commas
  def format_number(number)
    number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end
  
  # Print a summary of the statistics
  def print_summary
    puts "\n=== IP Block Statistics Summary ==="
    puts "\nTotal NICs: #{@stats[:totals][:nics]}"
    puts "Total Countries: #{@stats[:totals][:countries]}"
    puts "Total Unique IP Blocks: #{format_number(@stats[:totals][:flattened_blocks])}"
    puts "Total IP Addresses: #{format_number(@stats[:totals][:ip_addresses])}"
    
    # Show country counts per NIC
    puts "\nCountries per NIC:"
    @stats[:totals][:nic_countries].sort_by { |_, count| -count }.each do |nic, count|
      puts "  #{nic}: #{count} countries"
    end
    
    # Show raw block counts by NIC
    puts "\nRaw Block Counts by NIC:"
    @stats[:totals][:nic_blocks].sort_by { |_, count| -count }.each do |nic, count|
      puts "  #{nic}: #{format_number(count)} blocks"
    end
    puts "  Total NIC blocks (with potential duplicates): #{format_number(@stats[:totals][:sum_nic_blocks])}"
    
    # Show IP counts by NIC
    puts "\nIP Address Counts by NIC:"
    @stats[:nics].sort_by { |_, data| -data[:ip_addresses] }.each do |nic, data|
      puts "  #{nic}: #{format_number(data[:ip_addresses])} IPs"
    end
    
    if @stats[:totals][:original_blocks] > 0 && @stats[:totals][:original_blocks] > @stats[:totals][:flattened_blocks]
      puts "\nFlattening Efficiency:"
      puts "  Original Blocks: #{format_number(@stats[:totals][:original_blocks])}"
      puts "  Flattened Blocks: #{format_number(@stats[:totals][:flattened_blocks])}"
      puts "  Reduction: #{format_number(@stats[:totals][:flattening_reduction])} blocks (#{@stats[:totals][:flattening_efficiency]}%)"
    elsif @stats[:totals][:original_blocks] > 0
      puts "\nWarning: The flattened blocks count (#{@stats[:totals][:flattened_blocks]}) is not less than"
      puts "the original blocks count (#{@stats[:totals][:original_blocks]}). The flattening algorithm may not be working correctly,"
      puts "or there may be an issue with how blocks are being counted."
    end
    
    puts "\nTop 10 Countries by IP Blocks:"
    top_countries_blocks = @stats[:countries].sort_by { |_, data| -data[:blocks] }.first(10)
    top_countries_blocks.each do |country, data|
      nic_distribution = data[:nic_blocks].map { |nic, count| "#{nic}:#{count}" }.join(', ')
      puts "  #{country}: #{format_number(data[:blocks])} blocks, #{format_number(data[:ip_addresses])} IPs"
      puts "    NIC distribution: #{nic_distribution}"
    end
    
    puts "\nTop 10 Countries by IP Addresses:"
    top_countries_ips = @stats[:countries].sort_by { |_, data| -data[:ip_addresses] }.first(10)
    top_countries_ips.each do |country, data|
      nic_distribution = data[:nic_ips].map { |nic, count| "#{nic}:#{format_number(count)}" }.join(', ')
      puts "  #{country}: #{format_number(data[:ip_addresses])} IPs, #{format_number(data[:blocks])} blocks"
      puts "    NIC distribution: #{nic_distribution}"
    end
    
    puts "\nNIC Statistics:"
    @stats[:nics].sort_by { |_, data| -data[:blocks] }.each do |nic, data|
      puts "  #{nic}: #{data[:countries]} countries, #{format_number(data[:blocks])} blocks, #{format_number(data[:ip_addresses])} IPs"
    end
    
    if @stats[:totals][:original_blocks] > 0 && @stats[:totals][:original_blocks] > @stats[:totals][:flattened_blocks]
      puts "\nTop 10 Countries by Flattening Efficiency:"
      countries_with_efficiency = @stats[:countries].select { |_, data| data[:original_blocks] && data[:original_blocks] > 0 && data[:original_blocks] > data[:blocks] }
      countries_with_efficiency.each do |country, data|
        data[:flattening_efficiency] = ((data[:original_blocks] - data[:blocks]).to_f / data[:original_blocks] * 100).round(2)
      end
      
      top_efficient = countries_with_efficiency.sort_by { |_, data| -data[:flattening_efficiency] }.first(10)
      top_efficient.each do |country, data|
        reduction = data[:original_blocks] - data[:blocks]
        puts "  #{country}: #{format_number(reduction)} blocks reduced (#{data[:flattening_efficiency]}%)"
      end
    end
    
    # Verify for duplicate counts across NICs
    total_country_blocks = @stats[:countries].sum { |_, data| data[:blocks] }
    if total_country_blocks != @stats[:totals][:flattened_blocks]
      puts "\nWarning: Inconsistency detected in block counts!"
      puts "  Sum of country blocks: #{format_number(total_country_blocks)}"
      puts "  Total flattened blocks: #{format_number(@stats[:totals][:flattened_blocks])}"
    end
    
    if @stats[:analysis_time]
      puts "\nAnalysis completed in #{format_time(@stats[:analysis_time])}"
    end
  end
  
  # Main entry point for the analysis
  def analyze
    start_time = Time.now
    puts "Starting IP block statistics analysis..." if @options[:verbose]
    
    # First, detect and count NICs by finding mk_*.rsc files
    nic_files = Dir.glob(File.join(@options[:input_dir], "mk_*.rsc"))
    
    if nic_files.empty?
      puts "No NIC files found in #{@options[:input_dir]}"
      return
    end
    
    puts "Found #{nic_files.length} NIC files to analyze" if @options[:verbose]
    
    # Initialize block counters
    nic_country_blocks = {}  # Store the actual CIDR blocks for each NIC and country
    
    # Process each NIC file
    nic_files.each do |file_path|
      nic_name = File.basename(file_path, ".rsc").sub("mk_", "")
      puts "Analyzing NIC: #{nic_name}" if @options[:verbose]
      
      blocks_by_country = parse_mikrotik_file(file_path, nic_name)
      nic_country_blocks[nic_name] = blocks_by_country
      
      # Calculate NIC stats
      nic_total_blocks = 0
      nic_total_ips = 0
      
      blocks_by_country.each do |country, blocks|
        nic_total_blocks += blocks.length
        
        # Calculate IP addresses for this NIC
        block_ips = blocks.sum { |cidr| ip_count(cidr) }
        nic_total_ips += block_ips
        
        # Initialize country stats if needed
        @stats[:countries][country] ||= {
          blocks: 0,  # Will be set to unique blocks count later
          ip_addresses: 0,  # Will be set to unique IPs count later
          nics: [],
          nic_blocks: {},  # Store blocks per NIC
          nic_ips: {}      # Store IPs per NIC
        }
        
        # Record the blocks and IPs for this country and NIC
        @stats[:countries][country][:nic_blocks][nic_name] = blocks.length
        @stats[:countries][country][:nic_ips][nic_name] = block_ips
        
        # Add NIC to the country's list if not already there
        @stats[:countries][country][:nics] << nic_name unless @stats[:countries][country][:nics].include?(nic_name)
      end
      
      # Update NIC stats
      @stats[:nics][nic_name] = {
        countries: blocks_by_country.keys.length,
        blocks: nic_total_blocks,
        ip_addresses: nic_total_ips
      }
    end
    
    puts "Calculating per-country unique block counts..." if @options[:verbose]
    
    # Now calculate the actual blocks per country (with potential overlaps between NICs)
    @stats[:countries].each do |country, data|
      # Get all unique CIDR blocks for this country across all NICs
      all_blocks = []
      data[:nics].each do |nic|
        if nic_country_blocks[nic] && nic_country_blocks[nic][country]
          all_blocks.concat(nic_country_blocks[nic][country])
        end
      end
      
      # Count unique blocks (avoid duplicates across NICs)
      unique_blocks = all_blocks.uniq
      data[:blocks] = unique_blocks.length
      
      # Recalculate IP addresses from unique blocks
      data[:ip_addresses] = unique_blocks.sum { |cidr| ip_count(cidr) }
    end
    
    puts "Calculating summary statistics..." if @options[:verbose]
    
    # Calculate totals
    @stats[:totals][:nics] = @stats[:nics].keys.length
    @stats[:totals][:countries] = @stats[:countries].keys.length
    
    # Count total flattened blocks by summing unique country blocks
    @stats[:totals][:flattened_blocks] = @stats[:countries].sum { |_, data| data[:blocks] }
    
    # Calculate total IP addresses from unique blocks across all countries
    @stats[:totals][:ip_addresses] = @stats[:countries].sum { |_, data| data[:ip_addresses] }
    
    # Calculate total blocks per NIC
    @stats[:totals][:nic_blocks] = {}
    @stats[:nics].each do |nic, data|
      @stats[:totals][:nic_blocks][nic] = data[:blocks]
    end
    @stats[:totals][:sum_nic_blocks] = @stats[:totals][:nic_blocks].values.sum
    
    # Try to analyze original blocks from cache for flattening efficiency
    analyze_original_blocks
    
    # Calculate flattening efficiency if we have original block counts
    if @stats[:totals][:original_blocks] > 0
      reduction = @stats[:totals][:original_blocks] - @stats[:totals][:flattened_blocks]
      efficiency = (reduction.to_f / @stats[:totals][:original_blocks] * 100).round(2)
      @stats[:totals][:flattening_reduction] = reduction
      @stats[:totals][:flattening_efficiency] = efficiency
    end
    
    # Calculate number of unique countries per NIC for verification
    @stats[:totals][:nic_countries] = {}
    @stats[:countries].each do |country, data|
      data[:nics].each do |nic|
        @stats[:totals][:nic_countries][nic] ||= 0
        @stats[:totals][:nic_countries][nic] += 1
      end
    end
    
    # Verify the statistics for consistency
    verify_statistics
    
    # Calculate the analysis time
    elapsed_time = Time.now - start_time
    @stats[:analysis_time] = elapsed_time
    
    # Save statistics to file
    File.write(@options[:output_file], JSON.pretty_generate(@stats))
    puts "Statistics saved to #{@options[:output_file]}" if @options[:verbose]
    puts "Analysis completed in #{format_time(elapsed_time)}" if @options[:verbose]
    
    # Print summary
    print_summary
  end
end

# Main execution
if __FILE__ == $0
  # Parse command-line options
  options = {
    input_dir: '.',
    countries_dir: 'countries',
    cache_dir: '.cache',
    output_file: 'ip_stats.json',
    verbose: false,
    debug: false
  }
  
  option_parser = OptionParser.new do |opts|
    opts.banner = "Usage: #{$0} [options]"
    
    opts.on('-h', '--help', 'Show this help message') do
      puts opts
      exit
    end
    
    opts.on('-i', '--input-dir DIRECTORY', 'Directory containing Mikrotik .rsc files (default: current directory)') do |dir|
      options[:input_dir] = dir
    end
    
    opts.on('-c', '--countries-dir DIRECTORY', 'Directory containing individual country files (default: countries/)') do |dir|
      options[:countries_dir] = dir
    end
    
    opts.on('--cache-dir DIRECTORY', 'Cache directory to analyze original blocks (default: .cache/)') do |dir|
      options[:cache_dir] = dir
    end
    
    opts.on('-o', '--output-file FILE', 'File to save detailed statistics as JSON (default: ip_stats.json)') do |file|
      options[:output_file] = file
    end
    
    opts.on('-v', '--verbose', 'Enable verbose output') do
      options[:verbose] = true
    end
    
    opts.on('-d', '--debug', 'Enable debug output') do
      options[:debug] = true
      options[:verbose] = true  # Debug implies verbose
    end
  end
  
  option_parser.parse!
  
  # Run the analysis
  stats = IPBlockStats.new(options)
  stats.analyze
end
