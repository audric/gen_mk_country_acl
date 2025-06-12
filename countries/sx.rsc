# MikroTik RouterOS address list for SX
# Generated at: 2025-06-12 09:46:56 +0200
# Total CIDR blocks: 10

/ip firewall address-list
add list="SX country" address=131.161.84.0/22 comment="SX"
add list="SX country" address=168.0.84.0/22 comment="SX"
add list="SX country" address=168.197.108.0/22 comment="SX"
add list="SX country" address=170.0.16.0/22 comment="SX"
add list="SX country" address=190.102.0.0/19 comment="SX"
add list="SX country" address=190.124.216.0/22 comment="SX"
add list="SX country" address=190.185.64.0/19 comment="SX"
add list="SX country" address=200.0.22.0/23 comment="SX"
add list="SX country" address=200.7.32.0/19 comment="SX"
add list="SX country" address=201.220.0.0/20 comment="SX"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="SX country" comment="Allow SX traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="SX country" comment="Block SX traffic"
