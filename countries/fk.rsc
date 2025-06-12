# MikroTik RouterOS address list for FK
# Generated at: 2025-06-12 09:46:56 +0200
# Total CIDR blocks: 7

/ip firewall address-list
add list="FK country" address=80.73.208.0/20 comment="FK"
add list="FK country" address=91.232.129.0/24 comment="FK"
add list="FK country" address=91.232.198.0/24 comment="FK"
add list="FK country" address=91.232.208.0/24 comment="FK"
add list="FK country" address=91.232.235.0/24 comment="FK"
add list="FK country" address=185.87.144.0/22 comment="FK"
add list="FK country" address=185.244.12.0/22 comment="FK"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="FK country" comment="Allow FK traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="FK country" comment="Block FK traffic"
