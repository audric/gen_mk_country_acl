# MikroTik RouterOS address list for VA
# Generated at: 2025-06-12 09:46:56 +0200
# Total CIDR blocks: 4

/ip firewall address-list
add list="VA country" address=185.17.220.0/22 comment="VA"
add list="VA country" address=185.152.68.0/22 comment="VA"
add list="VA country" address=193.43.102.0/23 comment="VA"
add list="VA country" address=212.77.0.0/19 comment="VA"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="VA country" comment="Allow VA traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="VA country" comment="Block VA traffic"
