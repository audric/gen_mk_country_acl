# MikroTik RouterOS address list for KM
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 4

/ip firewall address-list
add list="KM country" address=102.207.176.0/22 comment="KM"
add list="KM country" address=102.223.120.0/22 comment="KM"
add list="KM country" address=164.160.136.0/22 comment="KM"
add list="KM country" address=197.255.224.0/20 comment="KM"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="KM country" log=yes
# add action=drop chain=forward src-address-list="KM country" log=yes
