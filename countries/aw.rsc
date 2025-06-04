# MikroTik RouterOS address list for AW
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 12

/ip firewall address-list
add list="AW country" address=138.255.252.0/22 comment="AW"
add list="AW country" address=170.84.254.0/24 comment="AW"
add list="AW country" address=179.61.32.0/19 comment="AW"
add list="AW country" address=181.41.0.0/18 comment="AW"
add list="AW country" address=186.96.200.0/21 comment="AW"
add list="AW country" address=186.96.224.0/20 comment="AW"
add list="AW country" address=186.96.240.0/21 comment="AW"
add list="AW country" address=186.189.0.0/18 comment="AW"
add list="AW country" address=186.189.128.0/18 comment="AW"
add list="AW country" address=190.12.224.0/19 comment="AW"
add list="AW country" address=190.104.96.0/20 comment="AW"
add list="AW country" address=201.229.0.0/17 comment="AW"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="AW country" log=yes
# add action=drop chain=forward src-address-list="AW country" log=yes
