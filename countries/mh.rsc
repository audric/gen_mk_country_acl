# MikroTik RouterOS address list for MH
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 7

/ip firewall address-list
add list="MH country" address=23.181.56.0/24 comment="MH"
add list="MH country" address=81.30.106.0/24 comment="MH"
add list="MH country" address=103.202.148.0/22 comment="MH"
add list="MH country" address=117.103.88.0/21 comment="MH"
add list="MH country" address=185.207.196.0/22 comment="MH"
add list="MH country" address=193.227.113.0/24 comment="MH"
add list="MH country" address=203.78.152.0/22 comment="MH"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="MH country" log=yes
# add action=drop chain=forward src-address-list="MH country" log=yes
