# MikroTik RouterOS address list for DJ
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 7

/ip firewall address-list
add list="DJ country" address=41.189.224.0/19 comment="DJ"
add list="DJ country" address=91.209.83.0/24 comment="DJ"
add list="DJ country" address=102.214.90.0/24 comment="DJ"
add list="DJ country" address=196.49.10.0/24 comment="DJ"
add list="DJ country" address=196.201.192.0/20 comment="DJ"
add list="DJ country" address=196.223.38.0/24 comment="DJ"
add list="DJ country" address=197.241.0.0/17 comment="DJ"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="DJ country" comment="Allow DJ traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="DJ country" comment="Block DJ traffic"
