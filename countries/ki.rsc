# MikroTik RouterOS address list for KI
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 5

/ip firewall address-list
add list="KI country" address=103.73.80.0/23 comment="KI"
add list="KI country" address=103.148.4.0/23 comment="KI"
add list="KI country" address=103.250.0.0/22 comment="KI"
add list="KI country" address=202.6.120.0/22 comment="KI"
add list="KI country" address=202.58.248.0/22 comment="KI"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="KI country" comment="Allow KI traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="KI country" comment="Block KI traffic"
