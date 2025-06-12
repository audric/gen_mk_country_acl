# MikroTik RouterOS address list for TK
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 3

/ip firewall address-list
add list="TK country" address=27.96.24.0/21 comment="TK"
add list="TK country" address=194.0.38.0/23 comment="TK"
add list="TK country" address=194.0.40.0/23 comment="TK"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="TK country" comment="Allow TK traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="TK country" comment="Block TK traffic"
