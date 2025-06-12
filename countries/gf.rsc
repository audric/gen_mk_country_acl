# MikroTik RouterOS address list for GF
# Generated at: 2025-06-12 09:46:56 +0200
# Total CIDR blocks: 6

/ip firewall address-list
add list="GF country" address=45.169.164.0/22 comment="GF"
add list="GF country" address=128.201.88.0/22 comment="GF"
add list="GF country" address=161.22.64.0/18 comment="GF"
add list="GF country" address=170.233.72.0/22 comment="GF"
add list="GF country" address=186.2.244.0/22 comment="GF"
add list="GF country" address=200.13.136.0/21 comment="GF"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="GF country" comment="Allow GF traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="GF country" comment="Block GF traffic"
