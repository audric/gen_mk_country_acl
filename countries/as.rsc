# MikroTik RouterOS address list for AS
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 2

/ip firewall address-list
add list="AS country" address=103.117.168.0/22 comment="AS"
add list="AS country" address=202.70.112.0/20 comment="AS"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="AS country" comment="Allow AS traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="AS country" comment="Block AS traffic"
