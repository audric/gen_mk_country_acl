# MikroTik RouterOS address list for GA
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 25

/ip firewall address-list
add list="GA country" address=41.78.240.0/22 comment="GA"
add list="GA country" address=41.158.0.0/15 comment="GA"
add list="GA country" address=41.211.128.0/18 comment="GA"
add list="GA country" address=102.129.32.0/22 comment="GA"
add list="GA country" address=102.134.28.0/22 comment="GA"
add list="GA country" address=102.142.0.0/16 comment="GA"
add list="GA country" address=102.164.124.0/22 comment="GA"
add list="GA country" address=154.0.32.0/19 comment="GA"
add list="GA country" address=154.0.176.0/20 comment="GA"
add list="GA country" address=154.112.0.0/16 comment="GA"
add list="GA country" address=154.116.0.0/17 comment="GA"
add list="GA country" address=154.119.192.0/19 comment="GA"
add list="GA country" address=160.119.160.0/19 comment="GA"
add list="GA country" address=169.159.0.0/18 comment="GA"
add list="GA country" address=169.239.148.0/22 comment="GA"
add list="GA country" address=169.255.148.0/22 comment="GA"
add list="GA country" address=192.188.164.0/22 comment="GA"
add list="GA country" address=192.189.139.0/24 comment="GA"
add list="GA country" address=192.189.140.0/24 comment="GA"
add list="GA country" address=196.49.17.0/24 comment="GA"
add list="GA country" address=196.50.32.0/23 comment="GA"
add list="GA country" address=196.223.39.0/24 comment="GA"
add list="GA country" address=197.231.64.0/18 comment="GA"
add list="GA country" address=197.242.0.0/19 comment="GA"
add list="GA country" address=217.77.64.0/20 comment="GA"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="GA country" comment="Allow GA traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="GA country" comment="Block GA traffic"
