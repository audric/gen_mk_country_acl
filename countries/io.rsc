# MikroTik RouterOS address list for IO
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 2

/ip firewall address-list
add list="IO country" address=202.44.112.0/22 comment="IO"
add list="IO country" address=203.83.48.0/21 comment="IO"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="IO country" comment="Allow IO traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="IO country" comment="Block IO traffic"
