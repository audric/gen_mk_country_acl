# MikroTik RouterOS address list for AX
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 1

/ip firewall address-list
add list="AX country" address=217.29.224.0/20 comment="AX"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="AX country" log=yes
# add action=drop chain=forward src-address-list="AX country" log=yes
