# MikroTik RouterOS address list for GW
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 3

/ip firewall address-list
add list="GW country" address=102.219.174.0/23 comment="GW"
add list="GW country" address=154.73.60.0/22 comment="GW"
add list="GW country" address=197.214.80.0/20 comment="GW"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="GW country" log=yes
# add action=drop chain=forward src-address-list="GW country" log=yes
