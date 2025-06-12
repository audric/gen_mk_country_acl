# MikroTik RouterOS address list for SM
# Generated at: 2025-06-12 09:46:56 +0200
# Total CIDR blocks: 22

/ip firewall address-list
add list="SM country" address=5.183.163.0/24 comment="SM"
add list="SM country" address=31.193.32.0/21 comment="SM"
add list="SM country" address=45.65.80.0/22 comment="SM"
add list="SM country" address=77.242.208.0/20 comment="SM"
add list="SM country" address=89.186.32.0/19 comment="SM"
add list="SM country" address=91.223.220.0/24 comment="SM"
add list="SM country" address=91.234.215.0/24 comment="SM"
add list="SM country" address=94.232.112.0/21 comment="SM"
add list="SM country" address=109.233.80.0/21 comment="SM"
add list="SM country" address=109.235.104.0/21 comment="SM"
add list="SM country" address=185.21.116.0/22 comment="SM"
add list="SM country" address=185.21.132.0/24 comment="SM"
add list="SM country" address=185.45.40.0/22 comment="SM"
add list="SM country" address=185.45.68.0/22 comment="SM"
add list="SM country" address=185.62.32.0/22 comment="SM"
add list="SM country" address=185.86.60.0/22 comment="SM"
add list="SM country" address=185.125.240.0/24 comment="SM"
add list="SM country" address=185.146.128.0/22 comment="SM"
add list="SM country" address=185.168.168.0/22 comment="SM"
add list="SM country" address=192.145.48.0/22 comment="SM"
add list="SM country" address=194.0.27.0/24 comment="SM"
add list="SM country" address=194.183.64.0/19 comment="SM"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="SM country" comment="Allow SM traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="SM country" comment="Block SM traffic"
