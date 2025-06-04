# MikroTik RouterOS address list for AS
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 2

/ip firewall address-list
add list="AS country" address=103.117.168.0/22 comment="AS"
add list="AS country" address=202.70.112.0/20 comment="AS"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="AS country" log=yes
# add action=drop chain=forward src-address-list="AS country" log=yes
