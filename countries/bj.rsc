# MikroTik RouterOS address list for BJ
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 34

/ip firewall address-list
add list="BJ country" address=41.74.0.0/20 comment="BJ"
add list="BJ country" address=41.79.216.0/22 comment="BJ"
add list="BJ country" address=41.85.160.0/19 comment="BJ"
add list="BJ country" address=41.86.224.0/19 comment="BJ"
add list="BJ country" address=41.138.88.0/22 comment="BJ"
add list="BJ country" address=41.191.84.0/22 comment="BJ"
add list="BJ country" address=41.216.32.0/19 comment="BJ"
add list="BJ country" address=41.222.192.0/22 comment="BJ"
add list="BJ country" address=41.223.248.0/22 comment="BJ"
add list="BJ country" address=45.221.224.0/19 comment="BJ"
add list="BJ country" address=81.91.224.0/20 comment="BJ"
add list="BJ country" address=102.38.128.0/19 comment="BJ"
add list="BJ country" address=102.207.72.0/22 comment="BJ"
add list="BJ country" address=102.207.112.0/22 comment="BJ"
add list="BJ country" address=102.209.80.0/22 comment="BJ"
add list="BJ country" address=102.214.143.0/24 comment="BJ"
add list="BJ country" address=102.214.247.0/24 comment="BJ"
add list="BJ country" address=102.215.88.0/22 comment="BJ"
add list="BJ country" address=102.215.93.0/24 comment="BJ"
add list="BJ country" address=102.215.124.0/22 comment="BJ"
add list="BJ country" address=102.215.136.0/22 comment="BJ"
add list="BJ country" address=102.222.216.0/22 comment="BJ"
add list="BJ country" address=137.255.0.0/16 comment="BJ"
add list="BJ country" address=154.65.28.0/22 comment="BJ"
add list="BJ country" address=154.66.128.0/20 comment="BJ"
add list="BJ country" address=154.127.32.0/20 comment="BJ"
add list="BJ country" address=156.0.212.0/22 comment="BJ"
add list="BJ country" address=160.119.144.0/22 comment="BJ"
add list="BJ country" address=164.160.140.0/22 comment="BJ"
add list="BJ country" address=196.49.8.0/24 comment="BJ"
add list="BJ country" address=196.192.16.0/20 comment="BJ"
add list="BJ country" address=196.223.40.0/24 comment="BJ"
add list="BJ country" address=196.251.152.0/22 comment="BJ"
add list="BJ country" address=197.234.216.0/21 comment="BJ"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="BJ country" log=yes
# add action=drop chain=forward src-address-list="BJ country" log=yes
