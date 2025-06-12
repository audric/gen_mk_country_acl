# MikroTik RouterOS address list for MS
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 2

/ip firewall address-list
add list="MS country" address=199.7.90.0/24 comment="MS"
add list="MS country" address=208.90.112.0/22 comment="MS"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="MS country" comment="Allow MS traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="MS country" comment="Block MS traffic"
