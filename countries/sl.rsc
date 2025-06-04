# MikroTik RouterOS address list for SL
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 26

/ip firewall address-list
add list="SL country" address=41.78.84.0/22 comment="SL"
add list="SL country" address=41.191.248.0/22 comment="SL"
add list="SL country" address=41.223.132.0/22 comment="SL"
add list="SL country" address=102.22.104.0/22 comment="SL"
add list="SL country" address=102.23.140.0/22 comment="SL"
add list="SL country" address=102.143.0.0/17 comment="SL"
add list="SL country" address=102.176.188.0/22 comment="SL"
add list="SL country" address=102.206.185.0/24 comment="SL"
add list="SL country" address=102.207.104.0/22 comment="SL"
add list="SL country" address=102.208.243.0/24 comment="SL"
add list="SL country" address=102.210.52.0/24 comment="SL"
add list="SL country" address=102.210.193.0/24 comment="SL"
add list="SL country" address=102.216.238.0/23 comment="SL"
add list="SL country" address=102.220.249.0/24 comment="SL"
add list="SL country" address=102.223.154.0/23 comment="SL"
add list="SL country" address=102.223.168.0/22 comment="SL"
add list="SL country" address=160.19.152.0/22 comment="SL"
add list="SL country" address=160.20.112.0/22 comment="SL"
add list="SL country" address=165.73.236.0/22 comment="SL"
add list="SL country" address=169.239.196.0/22 comment="SL"
add list="SL country" address=169.239.244.0/22 comment="SL"
add list="SL country" address=196.43.229.0/24 comment="SL"
add list="SL country" address=196.216.220.0/23 comment="SL"
add list="SL country" address=196.223.10.0/24 comment="SL"
add list="SL country" address=197.157.232.0/22 comment="SL"
add list="SL country" address=197.215.0.0/17 comment="SL"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="SL country" log=yes
# add action=drop chain=forward src-address-list="SL country" log=yes
