
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
- Combine all IP block data
- Flattens adjoining CIDR blocks to reduce the number of firewall rules (up to 80-90% reduction in some cases)
- Uses an optimized algorithm for extremely fast CIDR flattening
- Optional parallel processing for even faster performance
- Caching system for rapid subsequent runs
- Export options for individual country files in various formats
- Generates Mikrotik RouterOS scripts (.rsc files) for easy import

## Importing to Mikrotik RouterOS

After generating the .rsc files, transfer them to your Mikrotik router and import them:

```
mk_fw> /import file-name=ZZ.rsc
```

Then you can use the created address lists in your firewall rules:

```
mk_fw> /ip firewall filter
mk_fw> add action=drop chain=input src-address-list="ZZ country"
mk_fw> add action=drop chain=forward src-address-list="ZZ country"
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


1. Preserves Original NIC Files

Downloads all NIC files to a nic_downloads/ directory
Keeps these files permanently (with smart caching to avoid re-downloading within 24 hours)
Files are clearly named (e.g., arin_delegated.txt, apnic_delegated.txt)

2. Combines All Files

Creates a combined_delegations.txt file that merges all NIC data
Includes headers showing sources and generation time
Preserves the original data format for reference

3. Flattens/Optimizes CIDR Blocks

Advanced CIDR optimization: Converts IP count allocations to proper CIDR blocks
Merges overlapping and adjacent ranges: Significantly reduces the number of blocks
Creates optimized file: combined_delegations_optimized.txt with consolidated data
Shows optimization statistics: Reports reduction percentages per country

4. Generates Country-Specific .rsc Files

Only processes the optimized data for final extraction
Creates individual .rsc files for each country in the countries/ directory
Files are properly formatted for MikroTik RouterOS with usage examples

## Usage:
```
bashruby gen_mk_country_acl.rb
```

```
Directory Structure After Running:
├── gen_mk_country_acl.rb
├── nic_downloads/                    # Original NIC files (preserved)
│   ├── arin_delegated.txt
│   ├── afrinic_delegated.txt
│   ├── apnic_delegated.txt
│   ├── lacnic_delegated.txt
│   └── ripencc_delegated.txt
├── combined_delegations.txt          # All data combined
├── combined_delegations_optimized.txt # Optimized CIDR blocks
└── countries/                        # Country-specific .rsc files
    ├── us.rsc
    ├── cn.rsc
    ├── de.rsc
    ├── _summary.txt
    └── ... (one file per country)
```

The script now provides significant CIDR optimization, reducing the number of blocks substantially while maintaining complete coverage. The optimization typically achieves 20-50% reduction in block count depending on the country's IP allocation patterns.

## Notes

- NIC data can contain IP blocks from countries that do not belong to the NIC anymore
- Use caution when blocking countries in production environments
