# MikroTik RouterOS address list for CK
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 2

/ip firewall address-list
add list="CK country" address=116.199.200.0/23 comment="CK"
add list="CK country" address=202.65.32.0/19 comment="CK"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="CK country" comment="Allow CK traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="CK country" comment="Block CK traffic"
