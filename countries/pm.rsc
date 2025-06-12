# MikroTik RouterOS address list for PM
# Generated at: 2025-06-12 09:46:54 +0200
# Total CIDR blocks: 2

/ip firewall address-list
add list="PM country" address=70.36.0.0/20 comment="PM"
add list="PM country" address=142.202.130.0/23 comment="PM"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="PM country" comment="Allow PM traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="PM country" comment="Block PM traffic"
