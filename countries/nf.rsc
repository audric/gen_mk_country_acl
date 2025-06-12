# MikroTik RouterOS address list for NF
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 2

/ip firewall address-list
add list="NF country" address=103.43.204.0/23 comment="NF"
add list="NF country" address=203.142.221.0/24 comment="NF"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="NF country" comment="Allow NF traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="NF country" comment="Block NF traffic"
