# MikroTik RouterOS address list for PM
# Generated at: 2025-06-04 16:20:47 +0200
# Total CIDR blocks: 2

/ip firewall address-list
add list="PM country" address=70.36.0.0/20 comment="PM"
add list="PM country" address=142.202.130.0/23 comment="PM"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="PM country" log=yes
# add action=drop chain=forward src-address-list="PM country" log=yes
