# MikroTik RouterOS address list for TV
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 1

/ip firewall address-list
add list="TV country" address=202.2.96.0/19 comment="TV"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="TV country" comment="Allow TV traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="TV country" comment="Block TV traffic"
