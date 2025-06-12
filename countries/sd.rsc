# MikroTik RouterOS address list for SD
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 34

/ip firewall address-list
add list="SD country" address=41.67.0.0/18 comment="SD"
add list="SD country" address=41.78.108.0/22 comment="SD"
add list="SD country" address=41.95.0.0/16 comment="SD"
add list="SD country" address=41.202.160.0/19 comment="SD"
add list="SD country" address=41.209.64.0/18 comment="SD"
add list="SD country" address=41.218.0.0/18 comment="SD"
add list="SD country" address=41.223.160.0/22 comment="SD"
add list="SD country" address=41.223.200.0/22 comment="SD"
add list="SD country" address=41.240.0.0/15 comment="SD"
add list="SD country" address=62.12.96.0/20 comment="SD"
add list="SD country" address=102.120.0.0/13 comment="SD"
add list="SD country" address=102.130.248.0/21 comment="SD"
add list="SD country" address=102.143.128.0/17 comment="SD"
add list="SD country" address=102.181.0.0/17 comment="SD"
add list="SD country" address=102.181.128.0/18 comment="SD"
add list="SD country" address=102.181.192.0/19 comment="SD"
add list="SD country" address=102.210.236.0/22 comment="SD"
add list="SD country" address=102.218.68.0/22 comment="SD"
add list="SD country" address=102.218.99.0/24 comment="SD"
add list="SD country" address=102.220.152.0/22 comment="SD"
add list="SD country" address=105.238.0.0/15 comment="SD"
add list="SD country" address=154.96.0.0/13 comment="SD"
add list="SD country" address=155.196.0.0/16 comment="SD"
add list="SD country" address=196.1.192.0/18 comment="SD"
add list="SD country" address=196.29.160.0/19 comment="SD"
add list="SD country" address=196.49.66.0/24 comment="SD"
add list="SD country" address=196.202.128.0/19 comment="SD"
add list="SD country" address=196.223.20.0/24 comment="SD"
add list="SD country" address=196.223.152.0/21 comment="SD"
add list="SD country" address=197.208.0.0/15 comment="SD"
add list="SD country" address=197.251.0.0/17 comment="SD"
add list="SD country" address=197.252.0.0/16 comment="SD"
add list="SD country" address=197.254.192.0/18 comment="SD"
add list="SD country" address=212.0.128.0/19 comment="SD"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="SD country" comment="Allow SD traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="SD country" comment="Block SD traffic"
