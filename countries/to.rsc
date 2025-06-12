# MikroTik RouterOS address list for TO
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 11

/ip firewall address-list
add list="TO country" address=43.255.148.0/22 comment="TO"
add list="TO country" address=103.54.78.0/23 comment="TO"
add list="TO country" address=103.124.187.0/24 comment="TO"
add list="TO country" address=103.134.118.0/23 comment="TO"
add list="TO country" address=103.154.96.0/23 comment="TO"
add list="TO country" address=103.239.160.0/22 comment="TO"
add list="TO country" address=103.242.126.0/23 comment="TO"
add list="TO country" address=103.245.160.0/22 comment="TO"
add list="TO country" address=175.176.144.0/21 comment="TO"
add list="TO country" address=202.43.8.0/21 comment="TO"
add list="TO country" address=202.134.24.0/21 comment="TO"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="TO country" comment="Allow TO traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="TO country" comment="Block TO traffic"
