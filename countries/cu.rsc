# MikroTik RouterOS address list for CU
# Generated at: 2025-06-12 09:46:56 +0200
# Total CIDR blocks: 17

/ip firewall address-list
add list="CU country" address=152.206.0.0/15 comment="CU"
add list="CU country" address=169.158.0.0/16 comment="CU"
add list="CU country" address=181.225.224.0/19 comment="CU"
add list="CU country" address=190.6.64.0/19 comment="CU"
add list="CU country" address=190.15.144.0/20 comment="CU"
add list="CU country" address=190.92.112.0/20 comment="CU"
add list="CU country" address=190.107.0.0/20 comment="CU"
add list="CU country" address=196.1.112.0/24 comment="CU"
add list="CU country" address=196.1.135.0/24 comment="CU"
add list="CU country" address=196.3.152.0/24 comment="CU"
add list="CU country" address=200.0.16.0/24 comment="CU"
add list="CU country" address=200.0.24.0/22 comment="CU"
add list="CU country" address=200.5.12.0/22 comment="CU"
add list="CU country" address=200.13.144.0/21 comment="CU"
add list="CU country" address=200.14.48.0/21 comment="CU"
add list="CU country" address=200.55.128.0/18 comment="CU"
add list="CU country" address=201.220.192.0/19 comment="CU"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="CU country" comment="Allow CU traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="CU country" comment="Block CU traffic"
