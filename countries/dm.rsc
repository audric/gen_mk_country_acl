# MikroTik RouterOS address list for DM
# Generated at: 2025-06-04 16:20:47 +0200
# Total CIDR blocks: 14

/ip firewall address-list
add list="DM country" address=23.186.240.0/24 comment="DM"
add list="DM country" address=45.9.148.0/22 comment="DM"
add list="DM country" address=66.118.36.0/22 comment="DM"
add list="DM country" address=69.12.108.0/22 comment="DM"
add list="DM country" address=104.153.248.0/22 comment="DM"
add list="DM country" address=104.245.204.0/22 comment="DM"
add list="DM country" address=162.213.168.0/22 comment="DM"
add list="DM country" address=162.253.100.0/22 comment="DM"
add list="DM country" address=192.243.48.0/20 comment="DM"
add list="DM country" address=193.169.160.0/23 comment="DM"
add list="DM country" address=198.101.28.0/22 comment="DM"
add list="DM country" address=199.127.196.0/22 comment="DM"
add list="DM country" address=206.53.141.0/24 comment="DM"
add list="DM country" address=216.162.201.0/24 comment="DM"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="DM country" log=yes
# add action=drop chain=forward src-address-list="DM country" log=yes
