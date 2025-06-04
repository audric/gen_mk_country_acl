# MikroTik RouterOS address list for VI
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 24

/ip firewall address-list
add list="VI country" address=23.143.120.0/24 comment="VI"
add list="VI country" address=23.177.184.0/23 comment="VI"
add list="VI country" address=66.59.216.0/24 comment="VI"
add list="VI country" address=66.185.32.0/20 comment="VI"
add list="VI country" address=66.248.160.0/19 comment="VI"
add list="VI country" address=67.211.240.0/20 comment="VI"
add list="VI country" address=98.142.160.0/20 comment="VI"
add list="VI country" address=104.192.184.0/21 comment="VI"
add list="VI country" address=132.147.224.0/20 comment="VI"
add list="VI country" address=136.143.195.0/24 comment="VI"
add list="VI country" address=142.147.102.0/23 comment="VI"
add list="VI country" address=146.226.0.0/16 comment="VI"
add list="VI country" address=162.247.24.0/21 comment="VI"
add list="VI country" address=162.253.168.0/22 comment="VI"
add list="VI country" address=172.84.192.0/18 comment="VI"
add list="VI country" address=172.102.224.0/22 comment="VI"
add list="VI country" address=192.65.170.0/24 comment="VI"
add list="VI country" address=192.81.72.0/23 comment="VI"
add list="VI country" address=192.102.82.0/24 comment="VI"
add list="VI country" address=198.36.28.0/22 comment="VI"
add list="VI country" address=204.8.64.0/22 comment="VI"
add list="VI country" address=204.11.152.0/21 comment="VI"
add list="VI country" address=208.84.192.0/21 comment="VI"
add list="VI country" address=209.221.192.0/19 comment="VI"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="VI country" log=yes
# add action=drop chain=forward src-address-list="VI country" log=yes
