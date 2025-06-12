# MikroTik RouterOS address list for FM
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 5

/ip firewall address-list
add list="FM country" address=43.248.156.0/22 comment="FM"
add list="FM country" address=103.39.252.0/22 comment="FM"
add list="FM country" address=103.166.208.0/23 comment="FM"
add list="FM country" address=119.252.112.0/20 comment="FM"
add list="FM country" address=124.109.8.0/21 comment="FM"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="FM country" comment="Allow FM traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="FM country" comment="Block FM traffic"
