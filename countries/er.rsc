# MikroTik RouterOS address list for ER
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 1

/ip firewall address-list
add list="ER country" address=196.200.96.0/20 comment="ER"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="ER country" comment="Allow ER traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="ER country" comment="Block ER traffic"
