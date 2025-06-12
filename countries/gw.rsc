# MikroTik RouterOS address list for GW
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 3

/ip firewall address-list
add list="GW country" address=102.219.174.0/23 comment="GW"
add list="GW country" address=154.73.60.0/22 comment="GW"
add list="GW country" address=197.214.80.0/20 comment="GW"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="GW country" comment="Allow GW traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="GW country" comment="Block GW traffic"
