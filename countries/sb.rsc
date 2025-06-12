# MikroTik RouterOS address list for SB
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 12

/ip firewall address-list
add list="SB country" address=103.2.88.0/22 comment="SB"
add list="SB country" address=103.9.50.0/24 comment="SB"
add list="SB country" address=103.21.230.0/23 comment="SB"
add list="SB country" address=103.21.248.0/22 comment="SB"
add list="SB country" address=103.89.36.0/24 comment="SB"
add list="SB country" address=103.115.80.0/23 comment="SB"
add list="SB country" address=103.140.178.0/23 comment="SB"
add list="SB country" address=103.142.98.0/23 comment="SB"
add list="SB country" address=103.166.98.0/23 comment="SB"
add list="SB country" address=103.175.40.0/23 comment="SB"
add list="SB country" address=202.1.160.0/19 comment="SB"
add list="SB country" address=202.63.254.0/23 comment="SB"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="SB country" comment="Allow SB traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="SB country" comment="Block SB traffic"
