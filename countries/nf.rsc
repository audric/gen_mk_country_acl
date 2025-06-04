# MikroTik RouterOS address list for NF
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 2

/ip firewall address-list
add list="NF country" address=103.43.204.0/23 comment="NF"
add list="NF country" address=203.142.221.0/24 comment="NF"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="NF country" log=yes
# add action=drop chain=forward src-address-list="NF country" log=yes
