# MikroTik RouterOS address list for KN
# Generated at: 2025-06-04 16:20:47 +0200
# Total CIDR blocks: 16

/ip firewall address-list
add list="KN country" address=23.131.208.0/24 comment="KN"
add list="KN country" address=23.137.40.0/24 comment="KN"
add list="KN country" address=45.42.252.0/22 comment="KN"
add list="KN country" address=104.245.228.0/22 comment="KN"
add list="KN country" address=149.112.30.0/24 comment="KN"
add list="KN country" address=170.39.88.0/24 comment="KN"
add list="KN country" address=173.249.168.0/22 comment="KN"
add list="KN country" address=198.167.192.0/19 comment="KN"
add list="KN country" address=199.21.164.0/22 comment="KN"
add list="KN country" address=204.16.8.0/22 comment="KN"
add list="KN country" address=204.19.200.0/22 comment="KN"
add list="KN country" address=207.167.92.0/22 comment="KN"
add list="KN country" address=208.70.92.0/22 comment="KN"
add list="KN country" address=208.81.160.0/22 comment="KN"
add list="KN country" address=208.87.144.0/22 comment="KN"
add list="KN country" address=216.211.197.0/24 comment="KN"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="KN country" log=yes
# add action=drop chain=forward src-address-list="KN country" log=yes
