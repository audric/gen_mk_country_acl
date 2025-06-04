# MikroTik RouterOS address list for NU
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 2

/ip firewall address-list
add list="NU country" address=49.156.48.0/22 comment="NU"
add list="NU country" address=202.59.4.0/22 comment="NU"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="NU country" log=yes
# add action=drop chain=forward src-address-list="NU country" log=yes
