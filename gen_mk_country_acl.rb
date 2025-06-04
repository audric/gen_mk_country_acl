#!/usr/bin/env ruby
# Enhanced version of gen_mk_country_acl.rb with CIDR block flattening functionality
# Original repo: https://github.com/audric/gen_mk_country_acl

require 'net/ftp'
require 'ipaddr'
require 'uri'
require 'tempfile'
require 'open-uri'
require 'optparse'
require 'fileutils'
require 'json'
require 'digest'

# Constants for NIC sources
# These can be either FTP or HTTPS URLs
SOURCES = {
  'arin' => 'https://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest',
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

  # Converts IP range to array of integers [start_ip, end_ip]
  def self.cidr_to_range(cidr)
    ip = cidr_to_ipaddr(cidr)
    prefix = cidr.split('/')[1].to_i
    mask = (1 << (32 - prefix)) - 1
    start_ip = ip.to_i
    end_ip = start_ip | mask
    [start_ip, end_ip]
  end

  # Converts IP integer back to CIDR
  def self.range_to_cidrs(start_ip, end_ip)
    # Special case: if range is empty
    return [] if start_ip > end_ip

    # Initialize result
    result = []
    
    # Process until the entire range is converted to CIDRs
    while start_ip <= end_ip
      # Find the largest prefix (smallest mask) that fits in the range
      max_size = 32
      while max_size > 0
        mask = (1 << (32 - max_size)) - 1
        network_start = start_ip & ~mask
        network_end = network_start | mask
        
        # If the network extends beyond our range or doesn't start at our starting point, it's too big
        break if network_end > end_ip || network_start < start_ip
        max_size -= 1
      end
      
      # Create the CIDR from the calculated prefix
      prefix = max_size
      mask = (1 << (32 - prefix)) - 1
      network_start = start_ip & ~mask
      network_end = network_start | mask
      
      # Add the CIDR to the result
      cidr = "#{IPAddr.new(network_start, Socket::AF_INET)}/#{prefix}"
      result << cidr
      
      # Move to the next IP range
      start_ip = network_end + 1
    end
    
    result
  end

  # Fast method to flatten CIDRs by merging overlapping and adjacent ranges
  def self.flatten_cidrs_fast(cidrs)
    return [] if cidrs.empty?
    
    # Convert all CIDRs to [start_ip, end_ip] ranges
    ranges = cidrs.map { |cidr| cidr_to_range(cidr) }
    
    # Sort ranges by start IP
    ranges.sort!
    
    # Merge overlapping or adjacent ranges
    merged_ranges = []
    current_range = ranges.first
    
    ranges[1..-1].each do |range|
      if range[0] <= current_range[1] + 1
        # Ranges overlap or are adjacent, merge them
        current_range[1] = [current_range[1], range[1]].max
      else
        # Ranges don't overlap, add the current range to results and start a new one
        merged_ranges << current_range
        current_range = range
      end
    end
    
    # Add the last range
    merged_ranges << current_range
    
    # Convert merged ranges back to CIDRs
    result = []
    merged_ranges.each do |range|
      result.concat(range_to_cidrs(range[0], range[1]))
    end
    
    result
  end

  # Main function to process a list of IP blocks and return flattened list
  def self.flatten_ip_blocks(ip_blocks)
    flatten_cidrs_fast(ip_blocks)
  end
end

# Class to handle downloading and processing IP blocks
class IPBlockProcessor
  attr_reader :country_blocks

  # Class to handle caching operations
  class Cache
    def initialize(options = {})
      @cache_dir = options[:cache_dir] || '.cache'
      @enabled = options[:use_cache] || false
      @ttl = options[:cache_ttl] || 86400  # Default: 1 day in seconds
      
      # Create cache directory if it doesn't exist and caching is enabled
      if @enabled && !Dir.exist?(@cache_dir)
        FileUtils.mkdir_p(@cache_dir)
      end
    end
    
    # Calculate a cache key from a URL
    def cache_key(url)
      "#{Digest::MD5.hexdigest(url)}.cache"
    end
    
    # Full path to a cache file
    def cache_path(key)
      File.join(@cache_dir, key)
    end
    
    # Check if a cache entry exists and is valid
    def valid?(url)
      return false unless @enabled
      
      key = cache_key(url)
      path = cache_path(key)
      
      if File.exist?(path)
        # Check if the cache has expired
        if @ttl > 0
          mtime = File.mtime(path)
          return (Time.now - mtime) < @ttl
        else
          # If TTL is 0 or negative, cache never expires
          return true
        end
      end
      
      false
    end
    
    # Store data in cache
    def store(url, data)
      return unless @enabled
      
      key = cache_key(url)
      path = cache_path(key)
      
      begin
        File.write(path, data)
      rescue => e
        puts "Warning: Failed to write to cache: #{e.message}"
      end
    end
    
    # Retrieve data from cache
    def retrieve(url)
      return nil unless @enabled && valid?(url)
      
      key = cache_key(url)
      path = cache_path(key)
      
      begin
        return File.read(path)
      rescue => e
        puts "Warning: Failed to read from cache: #{e.message}"
        return nil
      end
    end
    
    # Store processed country blocks to avoid reprocessing
    def store_country_blocks(country_blocks, flattened = true)
      return unless @enabled
      
      path = cache_path(flattened ? "country_blocks_flattened.json" : "country_blocks.json")
      
      begin
        File.write(path, JSON.generate(country_blocks))
      rescue => e
        puts "Warning: Failed to store country blocks in cache: #{e.message}"
      end
    end
    
    # Retrieve processed country blocks
    def retrieve_country_blocks(flattened = true)
      return nil unless @enabled
      
      path = cache_path(flattened ? "country_blocks_flattened.json" : "country_blocks.json")
      
      return nil unless File.exist?(path)
      
      # Check if the cache has expired
      if @ttl > 0
        mtime = File.mtime(path)
        return nil if (Time.now - mtime) >= @ttl
      end
      
      begin
        data = File.read(path)
        return JSON.parse(data)
      rescue => e
        puts "Warning: Failed to retrieve country blocks from cache: #{e.message}"
        return nil
      end
    end
  end

  def initialize(options = {})
    @country_blocks = {}  # Hash to store country => [ip_blocks]
    @options = {
      output_dir: '.',
      skip_flattening: false,
      use_cache: false,
      cache_dir: '.cache',
      cache_ttl: 86400,  # Default: 1 day in seconds
      debug: false,
      verbose: false,
      parallel: false,
      batch_size: 20,     # Process countries in batches of 20 for parallel processing
      force_rebuild: false
    }.merge(options)
    
    # Initialize cache if enabled
    @cache = Cache.new(
      cache_dir: @options[:cache_dir],
      use_cache: @options[:use_cache],
      cache_ttl: @options[:cache_ttl]
    )
  end

  # For parallel processing, if available
  def parallel_map(items, &block)
    if defined?(Parallel) && @options[:parallel]
      require 'parallel'
      Parallel.map(items, &block)
    else
      items.map(&block)
    end
  end

  # Downloads data from a URL (FTP or HTTP/HTTPS)
  def download_data(url)
    # Check cache first
    cached_data = @cache.retrieve(url)
    if cached_data
      puts "  Using cached data for #{url}" if @options[:verbose]
      return cached_data
    end

    puts "  Downloading from #{url}..."
    uri = URI.parse(url)
    data = nil

    begin
      case uri.scheme.downcase
      when 'ftp'
        puts "  Using FTP protocol for #{url}" if @options[:verbose]
        temp_file = Tempfile.new('ip_data')
        
        Net::FTP.open(uri.host) do |ftp|
          ftp.login
          ftp.getbinaryfile(uri.path, temp_file.path)
        end
        
        data = File.read(temp_file.path)
        temp_file.close
        temp_file.unlink
      when 'http', 'https'
        puts "  Using HTTP/HTTPS protocol for #{url}" if @options[:verbose]
        require 'open-uri'
        data = URI.open(url).read
      else
        raise "Unsupported protocol: #{uri.scheme} for URL: #{url}"
      end
      
      # Store in cache if successful
      @cache.store(url, data) if data
      
    rescue => e
      raise "Error downloading from #{url}: #{e.message}"
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
    # Try to load from cache first if not forced to rebuild
    if !@options[:force_rebuild] && @options[:use_cache]
      cached_blocks = @cache.retrieve_country_blocks(false)
      if cached_blocks
        puts "Using cached country blocks..."
        @country_blocks = cached_blocks
        
        if @options[:skip_flattening]
          return
        else
          # If we want flattened blocks, check if those are cached
          flattened_blocks = @cache.retrieve_country_blocks(true)
          if flattened_blocks
            puts "Using cached flattened country blocks..."
            @country_blocks = flattened_blocks
            return
          else
            # Otherwise, just flatten the cached blocks
            flatten_country_blocks
            return
          end
        end
      end
    end
    
    # If we get here, we need to process the sources
    SOURCES.each do |nic, url|
      puts "Processing #{nic} data from #{url}..."
      begin
        data = download_data(url)
        parse_delegated_data(data, nic)
        puts "  Successfully processed #{nic} data" if @options[:verbose]
      rescue => e
        puts "Error processing #{nic}: #{e.message}"
        puts "  #{e.backtrace.join("\n  ")}" if @options[:debug]
      end
    end
    
    if @country_blocks.empty?
      puts "Warning: No IP blocks were found. Check your sources and network connection."
      exit 1
    end
    
    # Cache the unflattened blocks
    @cache.store_country_blocks(@country_blocks, false) if @options[:use_cache]
    
    # Flatten the IP blocks for each country
    flatten_country_blocks
    
    # Cache the flattened blocks
    @cache.store_country_blocks(@country_blocks, true) if @options[:use_cache] && !@options[:skip_flattening]
  end

  # Flattens IP blocks for all countries
  def flatten_country_blocks
    return if @options[:skip_flattening]
    
    puts "Flattening IP blocks for all countries..."
    total_original = 0
    total_flattened = 0
    
    # Process countries in batches for progress reporting
    countries = @country_blocks.keys
    total_countries = countries.size
    start_time = Time.now
    
    # Try to use parallel processing if enabled
    if @options[:parallel]
      puts "Using parallel processing for CIDR flattening..."
      # First, collect the total original count
      @country_blocks.each do |_, ip_blocks|
        total_original += ip_blocks.length
      end
      
      # Process countries in batches to avoid creating too many threads at once
      countries.each_slice(@options[:batch_size]) do |batch|
        puts "Processing batch of #{batch.size} countries..." if @options[:verbose]
        
        # Process this batch in parallel
        results = parallel_map(batch) do |country|
          ip_blocks = @country_blocks[country]
          flattened = CIDRFlattener.flatten_ip_blocks(ip_blocks)
          [country, flattened, ip_blocks.length, flattened.length]
        end
        
        # Update the country_blocks hash with results from this batch
        results.each do |country, flattened, original_count, flattened_count|
          @country_blocks[country] = flattened
          total_flattened += flattened_count
          
          if @options[:verbose] || original_count > 100
            reduction = original_count - flattened_count
            percent = original_count > 0 ? ((reduction.to_f / original_count) * 100).round(2) : 0
            puts "  #{country}: #{original_count} blocks flattened to #{flattened_count} (reduced by #{reduction} blocks, #{percent}%)"
          end
        end
      end
    else
      # Sequential processing with progress reporting
      countries.each_with_index do |country, index|
        ip_blocks = @country_blocks[country]
        total_original += ip_blocks.length
        
        # Only print detailed info for verbose mode or larger countries
        should_report = @options[:verbose] || ip_blocks.length > 100
        if should_report
          puts "  #{country}: #{ip_blocks.length} blocks (#{index+1}/#{total_countries})"
        elsif (index+1) % 10 == 0 || index+1 == total_countries
          # Simple progress reporting
          elapsed = Time.now - start_time
          estimated_total = (elapsed / (index+1)) * total_countries
          remaining = [estimated_total - elapsed, 0].max
          puts "  Processed #{index+1}/#{total_countries} countries. Est. time remaining: #{format_time(remaining)}"
        end
        
        # Flatten the blocks
        flattened = CIDRFlattener.flatten_ip_blocks(ip_blocks)
        @country_blocks[country] = flattened
        total_flattened += flattened.length
        
        if should_report
          reduction = ip_blocks.length - flattened.length
          percent = ip_blocks.length > 0 ? ((reduction.to_f / ip_blocks.length) * 100).round(2) : 0
          puts "    Flattened to #{flattened.length} blocks (reduced by #{reduction} blocks, #{percent}%)"
        end
      end
    end
    
    total_reduction = total_original - total_flattened
    total_percent = total_original > 0 ? ((total_reduction.to_f / total_original) * 100).round(2) : 0
    elapsed = Time.now - start_time
    puts "Total reduction: #{total_reduction} blocks (#{total_percent}%)"
    puts "Flattening completed in #{format_time(elapsed)}"
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

  # Generates Mikrotik RouterOS script files for each NIC
  def generate_mikrotik_scripts
    SOURCES.keys.each do |nic|
      filename = File.join(@options[:output_dir], "mk_#{nic}.rsc")
      puts "Generating #{filename}..."
      
      File.open(filename, 'w') do |file|
        file.puts "# Mikrotik RouterOS Country IP Blocks"
        file.puts "# Source: #{SOURCES[nic]}"
        file.puts "# Generated on: #{Time.now}"
        if !@options[:skip_flattening]
          file.puts "# IP blocks have been flattened where possible"
        end
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

  # Generates files for each individual country
  def generate_country_files
    return unless @options[:generate_country_files]
    
    # Create the countries directory if it doesn't exist
    countries_dir = File.join(@options[:output_dir], 'countries')
    FileUtils.mkdir_p(countries_dir)
    
    puts "Generating individual country files in #{countries_dir}..."
    total_countries = @country_blocks.keys.size
    count = 0
    
    @country_blocks.keys.sort.each do |country|
      count += 1
      ip_blocks = @country_blocks[country]
      next if ip_blocks.nil? || ip_blocks.empty?
      
      # Progress reporting
      if @options[:verbose] || (count % 20 == 0) || (count == total_countries)
        puts "  Generating file for #{country} (#{count}/#{total_countries})"
      end
      
      # Generate different formats based on options
      if @options[:country_format] == 'mikrotik'
        # Mikrotik RouterOS format
        filename = File.join(countries_dir, "#{country.downcase}.rsc")
        File.open(filename, 'w') do |file|
          file.puts "# Mikrotik RouterOS Country IP Blocks for #{country}"
          file.puts "# Generated on: #{Time.now}"
          file.puts ""
          file.puts "/ip firewall address-list"
          
          ip_blocks.each do |cidr|
            file.puts "add address=#{cidr} list=\"#{country} country\" comment=\"#{country}\""
          end
        end
      elsif @options[:country_format] == 'plain'
        # Plain text format, one CIDR per line
        filename = File.join(countries_dir, "#{country.downcase}.txt")
        File.open(filename, 'w') do |file|
          ip_blocks.each do |cidr|
            file.puts cidr
          end
        end
      elsif @options[:country_format] == 'csv'
        # CSV format
        filename = File.join(countries_dir, "#{country.downcase}.csv")
        File.open(filename, 'w') do |file|
          file.puts "country,cidr"
          ip_blocks.each do |cidr|
            file.puts "#{country},#{cidr}"
          end
        end
      else
        # JSON format (default)
        filename = File.join(countries_dir, "#{country.downcase}.json")
        File.open(filename, 'w') do |file|
          file.puts JSON.generate({
            country: country,
            generated_on: Time.now.to_s,
            ip_blocks: ip_blocks
          })
        end
      end
    end
    
    puts "Generated files for #{total_countries} countries."
  end
end

# Main execution
if __FILE__ == $0
  # Parse command-line options
  options = {
    use_https: false,
    output_dir: '.',
    skip_flattening: false,
    debug: false,
    verbose: false,
    parallel: false,
    use_cache: false,
    cache_dir: '.cache',
    cache_ttl: 86400,  # Default: 1 day in seconds
    batch_size: 20,    # Default batch size for parallel processing
    force_rebuild: false,
    generate_country_files: false,
    country_format: 'json'  # Default format for country files
  }
  
  option_parser = OptionParser.new do |opts|
    opts.banner = "Usage: #{$0} [options]"
    
    opts.on('-h', '--help', 'Show this help message') do
      puts opts
      exit
    end
    
    opts.on('--https', 'Use HTTPS instead of FTP for downloading data') do
      options[:use_https] = true
    end
    
    opts.on('-o', '--output-dir DIRECTORY', 'Directory to store output files') do |dir|
      options[:output_dir] = dir
    end
    
    opts.on('--skip-flattening', 'Skip the CIDR block flattening step') do
      options[:skip_flattening] = true
    end
    
    opts.on('--debug', 'Enable debug output for errors') do
      options[:debug] = true
    end
    
    opts.on('-v', '--verbose', 'Enable verbose output') do
      options[:verbose] = true
    end
    
    opts.on('-p', '--parallel', 'Enable parallel processing if the parallel gem is installed') do
      begin
        require 'parallel'
        options[:parallel] = true
        puts "Parallel processing enabled"
      rescue LoadError
        puts "Warning: Parallel gem not found. Install with: gem install parallel"
        options[:parallel] = false
      end
    end
    
    opts.on('--batch-size SIZE', Integer, 'Batch size for parallel processing (default: 20)') do |size|
      options[:batch_size] = size.to_i
    end
    
    opts.on('-c', '--cache', 'Enable caching to speed up subsequent runs') do
      options[:use_cache] = true
    end
    
    opts.on('--cache-dir DIR', 'Directory to store cache files (default: .cache)') do |dir|
      options[:cache_dir] = dir
    end
    
    opts.on('--cache-ttl SECONDS', Integer, 'Cache time-to-live in seconds (default: 86400 = 1 day)') do |ttl|
      options[:cache_ttl] = ttl.to_i
    end
    
    opts.on('-f', '--force', 'Force rebuild, ignoring cache') do
      options[:force_rebuild] = true
    end
    
    opts.on('--countries', 'Generate individual files for each country in the countries/ subdirectory') do
      options[:generate_country_files] = true
    end
    
    opts.on('--country-format FORMAT', ['json', 'plain', 'csv', 'mikrotik'], 
            'Format for country files: json, plain, csv, or mikrotik (default: json)') do |format|
      options[:country_format] = format
    end
    
    opts.on('--custom-source NIC,URL', Array, 'Specify a custom source (can be used multiple times)') do |nic_url|
      if nic_url.length == 2
        nic, url = nic_url
        SOURCES[nic] = url
      else
        puts "Error: --custom-source requires NIC,URL format"
        puts opts
        exit 1
      end
    end
  end
  
  option_parser.parse!
  
  # Convert FTP URLs to HTTPS if requested
  if options[:use_https]
    puts "Converting FTP URLs to HTTPS..."
    SOURCES.keys.each do |nic|
      if SOURCES[nic].start_with?('ftp://')
        SOURCES[nic] = SOURCES[nic].gsub('ftp://', 'https://')
        puts "  Converted #{nic} source to #{SOURCES[nic]}"
      end
    end
  end
  
  # Print all sources if verbose
  if options[:verbose]
    puts "Using the following sources:"
    SOURCES.each do |nic, url|
      puts "  #{nic}: #{url}"
    end
  end
  
  # Print a nice summary of options
  if options[:verbose]
    puts "Running with options:"
    puts "  Use HTTPS: #{options[:use_https]}"
    puts "  Output directory: #{options[:output_dir]}"
    puts "  Skip flattening: #{options[:skip_flattening]}"
    puts "  Parallel processing: #{options[:parallel]}"
    puts "  Batch size: #{options[:batch_size]}" if options[:parallel]
    puts "  Use cache: #{options[:use_cache]}"
    puts "  Cache directory: #{options[:cache_dir]}" if options[:use_cache]
    puts "  Cache TTL: #{options[:cache_ttl]} seconds" if options[:use_cache]
    puts "  Force rebuild: #{options[:force_rebuild]}"
    puts "  Generate country files: #{options[:generate_country_files]}"
    puts "  Country file format: #{options[:country_format]}" if options[:generate_country_files]
    puts "  Debug mode: #{options[:debug]}"
  end
  
  # Create output directory if it doesn't exist
  Dir.mkdir(options[:output_dir]) unless Dir.exist?(options[:output_dir])
  
  processor = IPBlockProcessor.new(options)
  processor.process_all_sources
  processor.generate_mikrotik_scripts
  
  # Generate individual country files if requested
  processor.generate_country_files if options[:generate_country_files]
  
  puts "All done! Mikrotik RouterOS scripts have been generated in #{options[:output_dir]}."
end
