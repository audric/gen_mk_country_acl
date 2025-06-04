# MikroTik RouterOS address list for VC
# Generated at: 2025-06-04 16:20:47 +0200
# Total CIDR blocks: 11

/ip firewall address-list
add list="VC country" address=23.170.80.0/24 comment="VC"
add list="VC country" address=45.42.232.0/22 comment="VC"
add list="VC country" address=104.219.24.0/22 comment="VC"
add list="VC country" address=104.255.232.0/22 comment="VC"
add list="VC country" address=162.212.210.0/23 comment="VC"
add list="VC country" address=192.58.140.0/23 comment="VC"
add list="VC country" address=199.192.224.0/23 comment="VC"
add list="VC country" address=204.13.240.0/22 comment="VC"
add list="VC country" address=206.83.47.0/24 comment="VC"
add list="VC country" address=207.191.240.0/21 comment="VC"
add list="VC country" address=208.84.200.0/21 comment="VC"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="VC country" log=yes
# add action=drop chain=forward src-address-list="VC country" log=yes
