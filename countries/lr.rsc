# MikroTik RouterOS address list for LR
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 19

/ip firewall address-list
add list="LR country" address=41.57.80.0/20 comment="LR"
add list="LR country" address=41.86.0.0/19 comment="LR"
add list="LR country" address=41.191.104.0/22 comment="LR"
add list="LR country" address=89.207.159.0/24 comment="LR"
add list="LR country" address=102.22.224.0/21 comment="LR"
add list="LR country" address=102.36.184.0/22 comment="LR"
add list="LR country" address=102.207.188.0/23 comment="LR"
add list="LR country" address=102.210.76.0/22 comment="LR"
add list="LR country" address=102.214.136.0/22 comment="LR"
add list="LR country" address=102.215.52.0/22 comment="LR"
add list="LR country" address=154.65.24.0/22 comment="LR"
add list="LR country" address=164.160.8.0/22 comment="LR"
add list="LR country" address=168.253.0.0/19 comment="LR"
add list="LR country" address=196.49.16.0/24 comment="LR"
add list="LR country" address=196.223.44.0/24 comment="LR"
add list="LR country" address=196.250.176.0/20 comment="LR"
add list="LR country" address=197.215.216.0/22 comment="LR"
add list="LR country" address=197.231.152.0/21 comment="LR"
add list="LR country" address=197.231.220.0/22 comment="LR"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="LR country" log=yes
# add action=drop chain=forward src-address-list="LR country" log=yes
