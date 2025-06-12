# MikroTik RouterOS address list for FO
# Generated at: 2025-06-12 09:46:56 +0200
# Total CIDR blocks: 14

/ip firewall address-list
add list="FO country" address=46.227.112.0/21 comment="FO"
add list="FO country" address=80.77.128.0/20 comment="FO"
add list="FO country" address=81.18.224.0/20 comment="FO"
add list="FO country" address=81.25.176.0/20 comment="FO"
add list="FO country" address=88.85.32.0/19 comment="FO"
add list="FO country" address=178.19.192.0/20 comment="FO"
add list="FO country" address=185.74.208.0/22 comment="FO"
add list="FO country" address=185.88.228.0/22 comment="FO"
add list="FO country" address=185.171.172.0/22 comment="FO"
add list="FO country" address=193.34.104.0/22 comment="FO"
add list="FO country" address=195.80.36.0/22 comment="FO"
add list="FO country" address=198.137.136.0/22 comment="FO"
add list="FO country" address=212.55.32.0/19 comment="FO"
add list="FO country" address=217.172.80.0/20 comment="FO"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="FO country" comment="Allow FO traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="FO country" comment="Block FO traffic"
