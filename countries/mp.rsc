# MikroTik RouterOS address list for MP
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 5

/ip firewall address-list
add list="MP country" address=45.117.196.0/22 comment="MP"
add list="MP country" address=103.1.96.0/22 comment="MP"
add list="MP country" address=103.57.232.0/22 comment="MP"
add list="MP country" address=202.88.64.0/19 comment="MP"
add list="MP country" address=210.23.80.0/20 comment="MP"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="MP country" comment="Allow MP traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="MP country" comment="Block MP traffic"
