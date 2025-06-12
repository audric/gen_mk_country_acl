# MikroTik RouterOS address list for GY
# Generated at: 2025-06-12 09:46:56 +0200
# Total CIDR blocks: 13

/ip firewall address-list
add list="GY country" address=138.94.248.0/22 comment="GY"
add list="GY country" address=168.232.144.0/22 comment="GY"
add list="GY country" address=179.51.205.0/24 comment="GY"
add list="GY country" address=181.41.64.0/18 comment="GY"
add list="GY country" address=181.177.216.0/22 comment="GY"
add list="GY country" address=181.199.224.0/19 comment="GY"
add list="GY country" address=190.80.0.0/17 comment="GY"
add list="GY country" address=190.93.36.0/22 comment="GY"
add list="GY country" address=190.105.156.0/22 comment="GY"
add list="GY country" address=190.108.196.0/22 comment="GY"
add list="GY country" address=190.108.200.0/21 comment="GY"
add list="GY country" address=190.108.208.0/21 comment="GY"
add list="GY country" address=190.124.220.0/22 comment="GY"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="GY country" comment="Allow GY traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="GY country" comment="Block GY traffic"
