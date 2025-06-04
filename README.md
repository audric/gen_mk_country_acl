
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

# Enhancements

This enhanced version has CIDR block flattening capability. The script downloads IP address blocks from various Network Information Centers (NICs) and generates Mikrotik RouterOS scripts for creating address lists for each country.

## Features

- Downloads IP block data from official NIC sources
- Supports both FTP and HTTPS protocols
- Flattens adjoining CIDR blocks to reduce the number of firewall rules
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

With debug output for troubleshooting:
```bash
./gen_mk_country_acl_with_flattening.rb --debug
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

## Requirements

- Ruby (tested with 2.5+)
- Standard Ruby libraries: net/ftp, ipaddr, uri, open-uri, tempfile, optparse

## To do
- maybe think some sort of postprocessor for (iptables, cisco...)

