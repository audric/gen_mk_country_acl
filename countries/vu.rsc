# MikroTik RouterOS address list for VU
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 20

/ip firewall address-list
add list="VU country" address=103.7.197.0/24 comment="VU"
add list="VU country" address=103.16.15.0/24 comment="VU"
add list="VU country" address=103.20.232.0/23 comment="VU"
add list="VU country" address=103.25.228.0/23 comment="VU"
add list="VU country" address=103.36.144.0/22 comment="VU"
add list="VU country" address=103.65.141.0/24 comment="VU"
add list="VU country" address=103.72.90.0/23 comment="VU"
add list="VU country" address=103.75.20.0/23 comment="VU"
add list="VU country" address=103.100.10.0/24 comment="VU"
add list="VU country" address=103.101.192.0/24 comment="VU"
add list="VU country" address=103.125.232.0/22 comment="VU"
add list="VU country" address=103.226.22.0/23 comment="VU"
add list="VU country" address=113.11.240.0/21 comment="VU"
add list="VU country" address=160.187.44.0/23 comment="VU"
add list="VU country" address=180.222.208.0/22 comment="VU"
add list="VU country" address=194.127.164.0/22 comment="VU"
add list="VU country" address=202.4.251.0/24 comment="VU"
add list="VU country" address=202.61.106.0/23 comment="VU"
add list="VU country" address=202.80.32.0/20 comment="VU"
add list="VU country" address=203.191.128.0/22 comment="VU"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="VU country" log=yes
# add action=drop chain=forward src-address-list="VU country" log=yes
