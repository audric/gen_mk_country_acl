
# Generate Mikrotik RouterOS script to add country ip blocks address lists

## Things to keep in mind
- acting on ip supposely from a country maybe stupid
- NIC data can contain IP blocks from countries that do not belong to the NIC anymore
- Use caution when blocking countries in production environments
  
## Sources:
- arin	https://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest
- afrinic	ftp://ftp.afrinic.net/pub/stats/afrinic/delegated-afrinic-latest
- apnic	ftp://ftp.apnic.net/pub/stats/apnic/delegated-apnic-latest
- lacnic	ftp://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-latest
- ripencc	ftp://ftp.ripe.net/ripe/stats/delegated-ripencc-latest

## Features

- Downloads IP block data from official NIC sources
- Supports both FTP and HTTPS protocols
- Flattens adjoining CIDR blocks to reduce the number of firewall rules (up to 80-90% reduction in some cases)
- Uses an optimized algorithm for extremely fast CIDR flattening
- Optional parallel processing for even faster performance
- Caching system for rapid subsequent runs
- Export options for individual country files in various formats
- Generates Mikrotik RouterOS scripts (.rsc files) for easy import# Enhanced gen_mk_country_acl

This is an enhanced version of the [gen_mk_country_acl](https://github.com/audric/gen_mk_country_acl) script with added CIDR block flattening capability. The script downloads IP address blocks from various Network Information Centers (NICs) and generates Mikrotik RouterOS scripts for creating address lists for each country.

## Features

- Downloads IP block data from official NIC sources
- Supports both FTP and HTTPS protocols
- Flattens adjoining CIDR blocks to reduce the number of firewall rules (up to 80-90% reduction in some cases)
- Uses an optimized algorithm for extremely fast CIDR flattening
- Optional parallel processing for even faster performance
- Generates Mikrotik RouterOS scripts (.rsc files) for easy import

## Usage

```bash
./gen_mk_country_acl_with_flattening.rb [options]
```

### Options

```
-h, --help                       Show help message
--https                          Use HTTPS instead of FTP for downloading data
-o, --output-dir DIRECTORY       Directory to store output files
--skip-flattening                Skip the CIDR block flattening step
--debug                          Enable debug output for errors
-v, --verbose                    Enable verbose output
-p, --parallel                   Enable parallel processing (requires 'parallel' gem)
--batch-size SIZE                Batch size for parallel processing (default: 20)
-c, --cache                      Enable caching to speed up subsequent runs
--cache-dir DIR                  Directory to store cache files (default: .cache)
--cache-ttl SECONDS              Cache time-to-live in seconds (default: 86400 = 1 day)
-f, --force                      Force rebuild, ignoring cache
--countries                      Generate individual files for each country in the countries/ subdirectory
--country-format FORMAT          Format for country files: json, plain, csv, or mikrotik (default: json)
--custom-source NIC,URL          Specify a custom source (can be used multiple times)
```

### Examples

Basic usage (using default FTP sources):
```bash
./gen_mk_country_acl_with_flattening.rb
```

Using HTTPS instead of FTP:
```bash
./gen_mk_country_acl_with_flattening.rb --https
```

Save output to a specific directory:
```bash
./gen_mk_country_acl_with_flattening.rb -o /path/to/output
```

Skip the CIDR flattening step:
```bash
./gen_mk_country_acl_with_flattening.rb --skip-flattening
```

Use a custom source:
```bash
./gen_mk_country_acl_with_flattening.rb --custom-source arin,https://example.com/path/to/arin-data
```

To use caching for faster subsequent runs:
```bash
./gen_mk_country_acl_with_flattening.rb -c
```

To generate individual country files:
```bash
./gen_mk_country_acl_with_flattening.rb --countries
```

To specify a different format for country files:
```bash
./gen_mk_country_acl_with_flattening.rb --countries --country-format=plain
```

To combine multiple options:
```bash
./gen_mk_country_acl_with_flattening.rb --https -p -v -c -o /path/to/output --countries
```

## Importing to Mikrotik RouterOS

After generating the .rsc files, transfer them to your Mikrotik router and import them:

```
mk_fw> /import file-name=mk_arin.rsc
mk_fw> /import file-name=mk_afrinic.rsc
mk_fw> /import file-name=mk_apnic.rsc
mk_fw> /import file-name=mk_lacnic.rsc
mk_fw> /import file-name=mk_ripencc.rsc
```

Then you can use the created address lists in your firewall rules:

```
mk_fw> /ip firewall filter
mk_fw> add action=drop chain=input src-address-list="ZZ country" log=yes
mk_fw> add action=drop chain=forward src-address-list="ZZ country" log=yes
```

Replace "ZZ" with the two-letter country code you want to block.

## Benefits of CIDR Flattening

The CIDR flattening feature merges adjacent IP blocks, significantly reducing the number of address list entries. This can improve router performance and make configurations more manageable.

For example, the blocks:
```
192.168.0.0/24
192.168.1.0/24
```

Can be merged into:
```
192.168.0.0/23
```

This reduction can be substantial for countries with many IP blocks.

## Performance Optimizations

The script includes several optimizations to make CIDR flattening much faster:

1. **Optimized Algorithm**: Instead of trying to iteratively merge pairs of CIDRs (which is O(n²) in the worst case), the script now:
   - Converts CIDRs to IP ranges (start and end addresses)
   - Sorts and merges overlapping or adjacent ranges in a single pass (O(n log n))
   - Converts the merged ranges back to optimal CIDR blocks

2. **Parallel Processing**: With the `-p/--parallel` option and the 'parallel' gem installed, the script can process multiple countries simultaneously, utilizing all available CPU cores.

3. **Progress Reporting**: For large datasets, the script provides progress updates and estimated completion times.

4. **Memory Efficiency**: The new algorithm is much more memory-efficient, avoiding the repeated object creation that slowed down the original algorithm.

5. **Caching System**: The `-c/--cache` option enables caching of downloaded data and processed country blocks for fast subsequent runs.

The result is CIDR flattening that completes in seconds instead of hours for large datasets.

## Requirements

- Ruby (tested with 2.5+)
- Standard Ruby libraries: net/ftp, ipaddr, uri, open-uri, tempfile, optparse, json, fileutils, digest
- Optional: parallel gem for multi-threading support

## Installation

```bash
# Basic installation
gem install ipaddr

# Optional: For parallel processing
gem install parallel
```

## Notes

- NIC data can contain IP blocks from countries that do not belong to the NIC anymore
- Use caution when blocking countries in production environments
