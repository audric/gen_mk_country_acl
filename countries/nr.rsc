# MikroTik RouterOS address list for NR
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 7

/ip firewall address-list
add list="NR country" address=43.230.6.0/24 comment="NR"
add list="NR country" address=103.20.124.0/24 comment="NR"
add list="NR country" address=103.36.150.0/23 comment="NR"
add list="NR country" address=103.49.173.0/24 comment="NR"
add list="NR country" address=103.49.174.0/23 comment="NR"
add list="NR country" address=203.98.224.0/19 comment="NR"
add list="NR country" address=203.190.216.0/24 comment="NR"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="NR country" log=yes
# add action=drop chain=forward src-address-list="NR country" log=yes
