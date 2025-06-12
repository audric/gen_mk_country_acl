# MikroTik RouterOS address list for NI
# Generated at: 2025-06-12 09:46:56 +0200
# Total CIDR blocks: 50

/ip firewall address-list
add list="NI country" address=45.5.216.0/22 comment="NI"
add list="NI country" address=45.170.224.0/22 comment="NI"
add list="NI country" address=45.182.142.0/24 comment="NI"
add list="NI country" address=45.238.28.0/22 comment="NI"
add list="NI country" address=131.255.16.0/24 comment="NI"
add list="NI country" address=138.97.160.0/22 comment="NI"
add list="NI country" address=138.117.4.0/22 comment="NI"
add list="NI country" address=138.185.28.0/22 comment="NI"
add list="NI country" address=138.185.104.0/22 comment="NI"
add list="NI country" address=143.137.24.0/22 comment="NI"
add list="NI country" address=143.202.252.0/22 comment="NI"
add list="NI country" address=152.231.32.0/20 comment="NI"
add list="NI country" address=161.0.32.0/19 comment="NI"
add list="NI country" address=165.98.0.0/16 comment="NI"
add list="NI country" address=170.80.16.0/22 comment="NI"
add list="NI country" address=170.84.132.0/22 comment="NI"
add list="NI country" address=170.246.152.0/22 comment="NI"
add list="NI country" address=186.1.0.0/18 comment="NI"
add list="NI country" address=186.76.0.0/15 comment="NI"
add list="NI country" address=190.106.0.0/19 comment="NI"
add list="NI country" address=190.106.48.0/20 comment="NI"
add list="NI country" address=190.107.208.0/22 comment="NI"
add list="NI country" address=190.124.32.0/21 comment="NI"
add list="NI country" address=190.143.240.0/20 comment="NI"
add list="NI country" address=190.181.128.0/18 comment="NI"
add list="NI country" address=190.184.0.0/17 comment="NI"
add list="NI country" address=190.212.0.0/16 comment="NI"
add list="NI country" address=191.98.224.0/21 comment="NI"
add list="NI country" address=191.98.232.0/22 comment="NI"
add list="NI country" address=191.98.236.0/23 comment="NI"
add list="NI country" address=191.98.238.0/24 comment="NI"
add list="NI country" address=191.98.240.0/20 comment="NI"
add list="NI country" address=191.102.48.0/21 comment="NI"
add list="NI country" address=191.103.112.0/20 comment="NI"
add list="NI country" address=192.107.104.0/24 comment="NI"
add list="NI country" address=192.136.42.0/23 comment="NI"
add list="NI country" address=192.136.44.0/22 comment="NI"
add list="NI country" address=200.1.152.0/24 comment="NI"
add list="NI country" address=200.6.55.0/24 comment="NI"
add list="NI country" address=200.9.187.0/24 comment="NI"
add list="NI country" address=200.9.188.0/22 comment="NI"
add list="NI country" address=200.9.192.0/24 comment="NI"
add list="NI country" address=200.10.205.0/24 comment="NI"
add list="NI country" address=200.11.30.0/24 comment="NI"
add list="NI country" address=200.62.64.0/18 comment="NI"
add list="NI country" address=200.85.160.0/20 comment="NI"
add list="NI country" address=200.106.247.0/24 comment="NI"
add list="NI country" address=201.131.66.0/24 comment="NI"
add list="NI country" address=201.131.115.0/24 comment="NI"
add list="NI country" address=207.248.86.0/24 comment="NI"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="NI country" comment="Allow NI traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="NI country" comment="Block NI traffic"
