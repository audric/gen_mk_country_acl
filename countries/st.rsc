# MikroTik RouterOS address list for ST
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 2

/ip firewall address-list
add list="ST country" address=154.72.12.0/22 comment="ST"
add list="ST country" address=197.159.160.0/19 comment="ST"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="ST country" comment="Allow ST traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="ST country" comment="Block ST traffic"
