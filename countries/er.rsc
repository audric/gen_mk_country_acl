# MikroTik RouterOS address list for ER
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 1

/ip firewall address-list
add list="ER country" address=196.200.96.0/20 comment="ER"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="ER country" log=yes
# add action=drop chain=forward src-address-list="ER country" log=yes
