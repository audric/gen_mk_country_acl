# MikroTik RouterOS address list for YT
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 1

/ip firewall address-list
add list="YT country" address=41.242.116.0/22 comment="YT"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="YT country" comment="Allow YT traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="YT country" comment="Block YT traffic"
