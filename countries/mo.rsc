# MikroTik RouterOS address list for MO
# Generated at: 2025-06-04 16:20:47 +0200
# Total CIDR blocks: 30

/ip firewall address-list
add list="MO country" address=23.148.24.0/24 comment="MO"
add list="MO country" address=27.109.128.0/17 comment="MO"
add list="MO country" address=43.247.24.0/22 comment="MO"
add list="MO country" address=45.64.20.0/22 comment="MO"
add list="MO country" address=45.123.200.0/22 comment="MO"
add list="MO country" address=60.246.0.0/16 comment="MO"
add list="MO country" address=103.5.218.0/23 comment="MO"
add list="MO country" address=103.88.176.0/22 comment="MO"
add list="MO country" address=103.96.60.0/22 comment="MO"
add list="MO country" address=103.115.140.0/22 comment="MO"
add list="MO country" address=103.143.92.0/23 comment="MO"
add list="MO country" address=103.192.44.0/22 comment="MO"
add list="MO country" address=103.233.188.0/22 comment="MO"
add list="MO country" address=103.237.100.0/22 comment="MO"
add list="MO country" address=103.237.124.0/22 comment="MO"
add list="MO country" address=103.240.56.0/23 comment="MO"
add list="MO country" address=113.52.64.0/18 comment="MO"
add list="MO country" address=116.193.8.0/21 comment="MO"
add list="MO country" address=122.100.128.0/17 comment="MO"
add list="MO country" address=123.253.200.0/22 comment="MO"
add list="MO country" address=125.31.0.0/18 comment="MO"
add list="MO country" address=161.64.0.0/16 comment="MO"
add list="MO country" address=163.53.244.0/22 comment="MO"
add list="MO country" address=180.94.128.0/18 comment="MO"
add list="MO country" address=182.93.0.0/18 comment="MO"
add list="MO country" address=202.75.248.0/22 comment="MO"
add list="MO country" address=202.86.128.0/18 comment="MO"
add list="MO country" address=202.174.0.0/22 comment="MO"
add list="MO country" address=202.175.0.0/17 comment="MO"
add list="MO country" address=202.175.160.0/19 comment="MO"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="MO country" log=yes
# add action=drop chain=forward src-address-list="MO country" log=yes
