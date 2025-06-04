# MikroTik RouterOS address list for TV
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 1

/ip firewall address-list
add list="TV country" address=202.2.96.0/19 comment="TV"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="TV country" log=yes
# add action=drop chain=forward src-address-list="TV country" log=yes
