# MikroTik RouterOS address list for YT
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 1

/ip firewall address-list
add list="YT country" address=41.242.116.0/22 comment="YT"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="YT country" log=yes
# add action=drop chain=forward src-address-list="YT country" log=yes
