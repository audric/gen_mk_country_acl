# MikroTik RouterOS address list for KP
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 1

/ip firewall address-list
add list="KP country" address=175.45.176.0/22 comment="KP"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="KP country" log=yes
# add action=drop chain=forward src-address-list="KP country" log=yes
