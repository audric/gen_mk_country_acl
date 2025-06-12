# MikroTik RouterOS address list for CG
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 21

/ip firewall address-list
add list="CG country" address=41.75.64.0/20 comment="CG"
add list="CG country" address=102.64.116.0/22 comment="CG"
add list="CG country" address=102.129.64.0/19 comment="CG"
add list="CG country" address=102.141.0.0/18 comment="CG"
add list="CG country" address=102.209.72.0/22 comment="CG"
add list="CG country" address=102.213.232.0/22 comment="CG"
add list="CG country" address=102.220.244.0/22 comment="CG"
add list="CG country" address=102.223.220.0/22 comment="CG"
add list="CG country" address=160.113.0.0/16 comment="CG"
add list="CG country" address=164.160.16.0/22 comment="CG"
add list="CG country" address=169.255.72.0/22 comment="CG"
add list="CG country" address=169.255.120.0/22 comment="CG"
add list="CG country" address=196.43.240.0/24 comment="CG"
add list="CG country" address=196.49.56.0/24 comment="CG"
add list="CG country" address=196.49.60.0/24 comment="CG"
add list="CG country" address=196.60.56.0/24 comment="CG"
add list="CG country" address=196.223.32.0/24 comment="CG"
add list="CG country" address=197.149.136.0/22 comment="CG"
add list="CG country" address=197.157.252.0/22 comment="CG"
add list="CG country" address=197.214.128.0/17 comment="CG"
add list="CG country" address=197.255.176.0/20 comment="CG"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="CG country" comment="Allow CG traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="CG country" comment="Block CG traffic"
