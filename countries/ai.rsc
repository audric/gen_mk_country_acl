# MikroTik RouterOS address list for AI
# Generated at: 2025-06-12 09:46:54 +0200
# Total CIDR blocks: 9

/ip firewall address-list
add list="AI country" address=104.192.92.0/22 comment="AI"
add list="AI country" address=104.193.196.0/22 comment="AI"
add list="AI country" address=104.255.176.0/22 comment="AI"
add list="AI country" address=162.251.108.0/22 comment="AI"
add list="AI country" address=162.254.188.0/22 comment="AI"
add list="AI country" address=192.30.124.0/24 comment="AI"
add list="AI country" address=195.149.107.0/24 comment="AI"
add list="AI country" address=204.14.248.0/21 comment="AI"
add list="AI country" address=208.66.48.0/21 comment="AI"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="AI country" comment="Allow AI traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="AI country" comment="Block AI traffic"
