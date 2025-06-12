# MikroTik RouterOS address list for KP
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 1

/ip firewall address-list
add list="KP country" address=175.45.176.0/22 comment="KP"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="KP country" comment="Allow KP traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="KP country" comment="Block KP traffic"
