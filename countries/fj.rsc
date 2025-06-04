# MikroTik RouterOS address list for FJ
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 35

/ip firewall address-list
add list="FJ country" address=27.123.128.0/18 comment="FJ"
add list="FJ country" address=45.112.224.0/22 comment="FJ"
add list="FJ country" address=45.117.240.0/21 comment="FJ"
add list="FJ country" address=103.1.180.0/22 comment="FJ"
add list="FJ country" address=103.52.88.0/22 comment="FJ"
add list="FJ country" address=103.58.20.0/22 comment="FJ"
add list="FJ country" address=103.71.204.0/24 comment="FJ"
add list="FJ country" address=103.76.157.0/24 comment="FJ"
add list="FJ country" address=103.77.225.0/24 comment="FJ"
add list="FJ country" address=103.99.43.0/24 comment="FJ"
add list="FJ country" address=103.101.240.0/22 comment="FJ"
add list="FJ country" address=103.116.156.0/24 comment="FJ"
add list="FJ country" address=103.137.129.0/24 comment="FJ"
add list="FJ country" address=103.147.194.0/23 comment="FJ"
add list="FJ country" address=103.148.54.0/23 comment="FJ"
add list="FJ country" address=103.178.195.0/24 comment="FJ"
add list="FJ country" address=103.244.228.0/22 comment="FJ"
add list="FJ country" address=110.35.88.0/21 comment="FJ"
add list="FJ country" address=113.20.64.0/19 comment="FJ"
add list="FJ country" address=119.235.64.0/19 comment="FJ"
add list="FJ country" address=119.235.96.0/21 comment="FJ"
add list="FJ country" address=124.108.24.0/21 comment="FJ"
add list="FJ country" address=144.120.0.0/16 comment="FJ"
add list="FJ country" address=183.81.128.0/20 comment="FJ"
add list="FJ country" address=202.62.6.0/23 comment="FJ"
add list="FJ country" address=202.62.118.0/23 comment="FJ"
add list="FJ country" address=202.62.120.0/21 comment="FJ"
add list="FJ country" address=202.129.228.0/22 comment="FJ"
add list="FJ country" address=202.137.176.0/21 comment="FJ"
add list="FJ country" address=202.151.16.0/20 comment="FJ"
add list="FJ country" address=202.170.32.0/20 comment="FJ"
add list="FJ country" address=203.83.251.0/24 comment="FJ"
add list="FJ country" address=203.119.51.0/24 comment="FJ"
add list="FJ country" address=203.202.235.0/24 comment="FJ"
add list="FJ country" address=210.7.0.0/19 comment="FJ"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="FJ country" log=yes
# add action=drop chain=forward src-address-list="FJ country" log=yes
