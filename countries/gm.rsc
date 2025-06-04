# MikroTik RouterOS address list for GM
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 23

/ip firewall address-list
add list="GM country" address=41.76.8.0/21 comment="GM"
add list="GM country" address=41.223.212.0/22 comment="GM"
add list="GM country" address=102.69.160.0/22 comment="GM"
add list="GM country" address=102.140.128.0/19 comment="GM"
add list="GM country" address=102.206.88.0/22 comment="GM"
add list="GM country" address=102.211.12.0/22 comment="GM"
add list="GM country" address=102.211.244.0/22 comment="GM"
add list="GM country" address=102.213.220.0/22 comment="GM"
add list="GM country" address=102.216.248.0/22 comment="GM"
add list="GM country" address=102.221.64.0/22 comment="GM"
add list="GM country" address=146.196.128.0/17 comment="GM"
add list="GM country" address=155.251.0.0/16 comment="GM"
add list="GM country" address=160.182.0.0/15 comment="GM"
add list="GM country" address=196.46.232.0/21 comment="GM"
add list="GM country" address=196.49.1.0/24 comment="GM"
add list="GM country" address=196.223.34.0/24 comment="GM"
add list="GM country" address=196.223.144.0/21 comment="GM"
add list="GM country" address=197.148.72.0/21 comment="GM"
add list="GM country" address=197.231.128.0/21 comment="GM"
add list="GM country" address=197.231.204.0/22 comment="GM"
add list="GM country" address=197.242.128.0/20 comment="GM"
add list="GM country" address=197.255.192.0/20 comment="GM"
add list="GM country" address=212.60.64.0/19 comment="GM"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="GM country" log=yes
# add action=drop chain=forward src-address-list="GM country" log=yes
