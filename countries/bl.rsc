# MikroTik RouterOS address list for BL
# Generated at: 2025-06-04 16:20:47 +0200
# Total CIDR blocks: 3

/ip firewall address-list
add list="BL country" address=23.135.232.0/24 comment="BL"
add list="BL country" address=149.112.20.0/24 comment="BL"
add list="BL country" address=206.83.45.0/24 comment="BL"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="BL country" log=yes
# add action=drop chain=forward src-address-list="BL country" log=yes
