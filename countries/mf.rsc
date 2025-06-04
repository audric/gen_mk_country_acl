# MikroTik RouterOS address list for MF
# Generated at: 2025-06-04 16:20:47 +0200
# Total CIDR blocks: 7

/ip firewall address-list
add list="MF country" address=23.138.120.0/24 comment="MF"
add list="MF country" address=148.64.60.0/23 comment="MF"
add list="MF country" address=149.112.46.0/23 comment="MF"
add list="MF country" address=158.222.40.0/23 comment="MF"
add list="MF country" address=192.96.136.0/23 comment="MF"
add list="MF country" address=192.139.192.0/24 comment="MF"
add list="MF country" address=204.27.52.0/22 comment="MF"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="MF country" log=yes
# add action=drop chain=forward src-address-list="MF country" log=yes
