# MikroTik RouterOS address list for AX
# Generated at: 2025-06-12 09:46:56 +0200
# Total CIDR blocks: 1

/ip firewall address-list
add list="AX country" address=217.29.224.0/20 comment="AX"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="AX country" comment="Allow AX traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="AX country" comment="Block AX traffic"
