# MikroTik RouterOS address list for PW
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 4

/ip firewall address-list
add list="PW country" address=103.30.248.0/22 comment="PW"
add list="PW country" address=103.159.28.0/23 comment="PW"
add list="PW country" address=103.251.132.0/23 comment="PW"
add list="PW country" address=202.124.224.0/20 comment="PW"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="PW country" comment="Allow PW traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="PW country" comment="Block PW traffic"
