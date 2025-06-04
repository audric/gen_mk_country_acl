# MikroTik RouterOS address list for GD
# Generated at: 2025-06-04 16:20:47 +0200
# Total CIDR blocks: 14

/ip firewall address-list
add list="GD country" address=23.128.4.0/24 comment="GD"
add list="GD country" address=23.130.168.0/24 comment="GD"
add list="GD country" address=23.141.216.0/24 comment="GD"
add list="GD country" address=45.42.225.0/24 comment="GD"
add list="GD country" address=67.159.199.0/24 comment="GD"
add list="GD country" address=74.117.84.0/22 comment="GD"
add list="GD country" address=74.122.88.0/21 comment="GD"
add list="GD country" address=104.245.48.0/22 comment="GD"
add list="GD country" address=104.245.92.0/22 comment="GD"
add list="GD country" address=162.245.152.0/22 comment="GD"
add list="GD country" address=196.3.73.0/24 comment="GD"
add list="GD country" address=199.83.192.0/21 comment="GD"
add list="GD country" address=199.85.236.0/22 comment="GD"
add list="GD country" address=206.126.244.0/24 comment="GD"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="GD country" log=yes
# add action=drop chain=forward src-address-list="GD country" log=yes
