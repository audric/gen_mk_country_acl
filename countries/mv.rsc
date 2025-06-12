# MikroTik RouterOS address list for MV
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 45

/ip firewall address-list
add list="MV country" address=27.114.128.0/18 comment="MV"
add list="MV country" address=36.255.104.0/23 comment="MV"
add list="MV country" address=43.226.220.0/22 comment="MV"
add list="MV country" address=43.231.28.0/22 comment="MV"
add list="MV country" address=43.247.140.0/22 comment="MV"
add list="MV country" address=69.94.32.0/20 comment="MV"
add list="MV country" address=69.94.80.0/20 comment="MV"
add list="MV country" address=83.137.200.0/21 comment="MV"
add list="MV country" address=103.15.52.0/22 comment="MV"
add list="MV country" address=103.19.224.0/22 comment="MV"
add list="MV country" address=103.31.84.0/22 comment="MV"
add list="MV country" address=103.50.104.0/22 comment="MV"
add list="MV country" address=103.55.161.0/24 comment="MV"
add list="MV country" address=103.67.26.0/24 comment="MV"
add list="MV country" address=103.71.57.0/24 comment="MV"
add list="MV country" address=103.76.2.0/24 comment="MV"
add list="MV country" address=103.84.132.0/24 comment="MV"
add list="MV country" address=103.84.134.0/24 comment="MV"
add list="MV country" address=103.87.188.0/24 comment="MV"
add list="MV country" address=103.103.66.0/24 comment="MV"
add list="MV country" address=103.110.40.0/24 comment="MV"
add list="MV country" address=103.110.109.0/24 comment="MV"
add list="MV country" address=103.110.110.0/23 comment="MV"
add list="MV country" address=103.119.75.0/24 comment="MV"
add list="MV country" address=103.141.98.0/24 comment="MV"
add list="MV country" address=103.143.252.0/24 comment="MV"
add list="MV country" address=103.172.31.0/24 comment="MV"
add list="MV country" address=103.173.79.0/24 comment="MV"
add list="MV country" address=103.182.172.0/24 comment="MV"
add list="MV country" address=103.191.77.0/24 comment="MV"
add list="MV country" address=103.197.164.0/22 comment="MV"
add list="MV country" address=103.248.112.0/22 comment="MV"
add list="MV country" address=115.84.128.0/19 comment="MV"
add list="MV country" address=123.176.0.0/19 comment="MV"
add list="MV country" address=124.195.192.0/19 comment="MV"
add list="MV country" address=150.107.196.0/22 comment="MV"
add list="MV country" address=185.215.32.0/22 comment="MV"
add list="MV country" address=202.1.192.0/20 comment="MV"
add list="MV country" address=202.21.176.0/20 comment="MV"
add list="MV country" address=202.153.80.0/21 comment="MV"
add list="MV country" address=203.82.2.0/23 comment="MV"
add list="MV country" address=203.104.24.0/21 comment="MV"
add list="MV country" address=209.212.192.0/19 comment="MV"
add list="MV country" address=216.183.208.0/20 comment="MV"
add list="MV country" address=220.158.220.0/22 comment="MV"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="MV country" comment="Allow MV traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="MV country" comment="Block MV traffic"
