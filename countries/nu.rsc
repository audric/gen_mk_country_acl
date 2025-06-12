# MikroTik RouterOS address list for NU
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 2

/ip firewall address-list
add list="NU country" address=49.156.48.0/22 comment="NU"
add list="NU country" address=202.59.4.0/22 comment="NU"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="NU country" comment="Allow NU traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="NU country" comment="Block NU traffic"
