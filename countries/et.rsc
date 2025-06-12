# MikroTik RouterOS address list for ET
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 15

/ip firewall address-list
add list="ET country" address=102.208.96.0/22 comment="ET"
add list="ET country" address=102.208.136.0/22 comment="ET"
add list="ET country" address=102.211.105.0/24 comment="ET"
add list="ET country" address=102.212.10.0/24 comment="ET"
add list="ET country" address=102.212.68.0/22 comment="ET"
add list="ET country" address=102.213.68.0/22 comment="ET"
add list="ET country" address=102.218.0.0/22 comment="ET"
add list="ET country" address=102.218.48.0/22 comment="ET"
add list="ET country" address=164.160.184.0/22 comment="ET"
add list="ET country" address=196.49.98.0/24 comment="ET"
add list="ET country" address=196.60.116.0/24 comment="ET"
add list="ET country" address=196.188.0.0/14 comment="ET"
add list="ET country" address=197.154.0.0/16 comment="ET"
add list="ET country" address=197.156.64.0/18 comment="ET"
add list="ET country" address=213.55.64.0/18 comment="ET"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="ET country" comment="Allow ET traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="ET country" comment="Block ET traffic"
