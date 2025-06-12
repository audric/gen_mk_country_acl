# MikroTik RouterOS address list for KY
# Generated at: 2025-06-12 09:46:54 +0200
# Total CIDR blocks: 32

/ip firewall address-list
add list="KY country" address=23.188.0.0/24 comment="KY"
add list="KY country" address=45.144.204.0/22 comment="KY"
add list="KY country" address=45.152.156.0/22 comment="KY"
add list="KY country" address=63.136.112.0/21 comment="KY"
add list="KY country" address=64.239.32.0/22 comment="KY"
add list="KY country" address=64.239.116.0/22 comment="KY"
add list="KY country" address=74.117.216.0/21 comment="KY"
add list="KY country" address=74.222.64.0/19 comment="KY"
add list="KY country" address=76.76.15.0/24 comment="KY"
add list="KY country" address=138.43.115.0/24 comment="KY"
add list="KY country" address=138.43.248.0/22 comment="KY"
add list="KY country" address=148.51.0.0/17 comment="KY"
add list="KY country" address=149.112.19.0/24 comment="KY"
add list="KY country" address=157.207.32.0/22 comment="KY"
add list="KY country" address=161.199.132.0/22 comment="KY"
add list="KY country" address=162.211.136.0/22 comment="KY"
add list="KY country" address=162.247.220.0/22 comment="KY"
add list="KY country" address=162.249.128.0/21 comment="KY"
add list="KY country" address=173.225.208.0/20 comment="KY"
add list="KY country" address=185.158.252.0/22 comment="KY"
add list="KY country" address=192.0.4.0/22 comment="KY"
add list="KY country" address=192.160.250.0/24 comment="KY"
add list="KY country" address=199.201.84.0/22 comment="KY"
add list="KY country" address=207.211.224.0/21 comment="KY"
add list="KY country" address=208.82.216.0/22 comment="KY"
add list="KY country" address=208.157.144.0/21 comment="KY"
add list="KY country" address=208.168.224.0/19 comment="KY"
add list="KY country" address=209.27.52.0/22 comment="KY"
add list="KY country" address=209.27.60.0/22 comment="KY"
add list="KY country" address=216.25.44.0/22 comment="KY"
add list="KY country" address=216.25.64.0/22 comment="KY"
add list="KY country" address=216.144.80.0/20 comment="KY"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="KY country" comment="Allow KY traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="KY country" comment="Block KY traffic"
