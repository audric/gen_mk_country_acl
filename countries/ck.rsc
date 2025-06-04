# MikroTik RouterOS address list for CK
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 2

/ip firewall address-list
add list="CK country" address=116.199.200.0/23 comment="CK"
add list="CK country" address=202.65.32.0/19 comment="CK"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="CK country" log=yes
# add action=drop chain=forward src-address-list="CK country" log=yes
