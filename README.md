
# Mikrotik country Access List generator

## Features

- Downloads IP block data from official NIC sources
- Supports both FTP and HTTPS protocols
- Combine all IP block data
- Flattens adjoining CIDR blocks to reduce the number of firewall rules (up to 80-90% reduction in some cases)
- Caching system for rapid subsequent runs (24 hour cache)
- Optimized processing for faster performance
- Generates Mikrotik RouterOS scripts per country (.rsc files) for easy import

## Usage:
```
ruby gen_mk_country_acl.rb
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

## Things to keep in mind
- Acting on ip supposely from a country maybe stupid/useless
- Use caution when blocking countries in production environments

## Sources:
- arin	https://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest
- afrinic	ftp://ftp.afrinic.net/pub/stats/afrinic/delegated-afrinic-latest
- apnic	ftp://ftp.apnic.net/pub/stats/apnic/delegated-apnic-latest
- lacnic	ftp://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-latest
- ripencc	ftp://ftp.ripe.net/ripe/stats/delegated-ripencc-latest

