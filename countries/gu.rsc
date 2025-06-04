# MikroTik RouterOS address list for GU
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 27

/ip firewall address-list
add list="GU country" address=43.240.88.0/22 comment="GU"
add list="GU country" address=43.247.60.0/22 comment="GU"
add list="GU country" address=49.128.104.0/22 comment="GU"
add list="GU country" address=101.99.128.0/17 comment="GU"
add list="GU country" address=103.3.240.0/22 comment="GU"
add list="GU country" address=103.7.100.0/22 comment="GU"
add list="GU country" address=103.17.112.0/22 comment="GU"
add list="GU country" address=103.115.192.0/23 comment="GU"
add list="GU country" address=103.142.152.0/23 comment="GU"
add list="GU country" address=103.212.24.0/22 comment="GU"
add list="GU country" address=114.142.192.0/18 comment="GU"
add list="GU country" address=116.68.0.0/19 comment="GU"
add list="GU country" address=117.20.120.0/21 comment="GU"
add list="GU country" address=121.55.192.0/18 comment="GU"
add list="GU country" address=139.5.136.0/22 comment="GU"
add list="GU country" address=168.123.0.0/16 comment="GU"
add list="GU country" address=182.173.192.0/18 comment="GU"
add list="GU country" address=192.149.202.0/24 comment="GU"
add list="GU country" address=202.22.176.0/20 comment="GU"
add list="GU country" address=202.47.144.0/20 comment="GU"
add list="GU country" address=202.123.128.0/19 comment="GU"
add list="GU country" address=202.128.0.0/19 comment="GU"
add list="GU country" address=202.128.64.0/19 comment="GU"
add list="GU country" address=202.131.160.0/19 comment="GU"
add list="GU country" address=202.151.64.0/19 comment="GU"
add list="GU country" address=203.95.8.0/21 comment="GU"
add list="GU country" address=203.215.52.0/22 comment="GU"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="GU country" log=yes
# add action=drop chain=forward src-address-list="GU country" log=yes
