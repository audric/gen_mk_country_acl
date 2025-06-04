# MikroTik RouterOS address list for CF
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 4

/ip firewall address-list
add list="CF country" address=41.78.120.0/22 comment="CF"
add list="CF country" address=41.223.184.0/22 comment="CF"
add list="CF country" address=169.239.96.0/22 comment="CF"
add list="CF country" address=197.242.176.0/21 comment="CF"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="CF country" log=yes
# add action=drop chain=forward src-address-list="CF country" log=yes
