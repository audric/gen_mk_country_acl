# MikroTik RouterOS address list for JM
# Generated at: 2025-06-12 09:46:54 +0200
# Total CIDR blocks: 50

/ip firewall address-list
add list="JM country" address=23.156.32.0/24 comment="JM"
add list="JM country" address=63.143.64.0/18 comment="JM"
add list="JM country" address=64.112.16.0/22 comment="JM"
add list="JM country" address=65.183.0.0/20 comment="JM"
add list="JM country" address=66.54.112.0/20 comment="JM"
add list="JM country" address=66.71.196.0/23 comment="JM"
add list="JM country" address=66.212.52.0/22 comment="JM"
add list="JM country" address=66.249.144.0/20 comment="JM"
add list="JM country" address=67.213.144.0/20 comment="JM"
add list="JM country" address=69.160.96.0/19 comment="JM"
add list="JM country" address=72.27.0.0/17 comment="JM"
add list="JM country" address=72.27.128.0/18 comment="JM"
add list="JM country" address=72.27.192.0/19 comment="JM"
add list="JM country" address=74.116.56.0/22 comment="JM"
add list="JM country" address=96.43.160.0/19 comment="JM"
add list="JM country" address=104.152.236.0/22 comment="JM"
add list="JM country" address=104.244.224.0/21 comment="JM"
add list="JM country" address=142.0.224.0/20 comment="JM"
add list="JM country" address=162.216.160.0/21 comment="JM"
add list="JM country" address=162.246.0.0/22 comment="JM"
add list="JM country" address=170.62.168.0/22 comment="JM"
add list="JM country" address=170.62.196.0/22 comment="JM"
add list="JM country" address=173.225.240.0/20 comment="JM"
add list="JM country" address=184.170.0.0/18 comment="JM"
add list="JM country" address=192.131.32.0/21 comment="JM"
add list="JM country" address=196.1.136.0/24 comment="JM"
add list="JM country" address=196.1.138.0/23 comment="JM"
add list="JM country" address=196.2.0.0/23 comment="JM"
add list="JM country" address=196.3.0.0/21 comment="JM"
add list="JM country" address=196.3.95.0/24 comment="JM"
add list="JM country" address=196.3.104.0/24 comment="JM"
add list="JM country" address=196.3.153.0/24 comment="JM"
add list="JM country" address=196.3.184.0/21 comment="JM"
add list="JM country" address=196.32.0.0/21 comment="JM"
add list="JM country" address=198.58.0.0/23 comment="JM"
add list="JM country" address=199.73.60.0/22 comment="JM"
add list="JM country" address=199.115.28.0/23 comment="JM"
add list="JM country" address=199.195.220.0/22 comment="JM"
add list="JM country" address=200.9.115.0/24 comment="JM"
add list="JM country" address=200.10.152.0/24 comment="JM"
add list="JM country" address=206.41.107.0/24 comment="JM"
add list="JM country" address=207.204.64.0/18 comment="JM"
add list="JM country" address=207.254.128.0/20 comment="JM"
add list="JM country" address=208.131.160.0/19 comment="JM"
add list="JM country" address=208.138.16.0/20 comment="JM"
add list="JM country" address=208.138.32.0/20 comment="JM"
add list="JM country" address=208.163.32.0/19 comment="JM"
add list="JM country" address=209.112.84.0/22 comment="JM"
add list="JM country" address=209.236.0.0/18 comment="JM"
add list="JM country" address=216.10.208.0/20 comment="JM"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="JM country" comment="Allow JM traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="JM country" comment="Block JM traffic"
