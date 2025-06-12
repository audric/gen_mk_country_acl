# MikroTik RouterOS address list for KM
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 4

/ip firewall address-list
add list="KM country" address=102.207.176.0/22 comment="KM"
add list="KM country" address=102.223.120.0/22 comment="KM"
add list="KM country" address=164.160.136.0/22 comment="KM"
add list="KM country" address=197.255.224.0/20 comment="KM"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="KM country" comment="Allow KM traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="KM country" comment="Block KM traffic"
