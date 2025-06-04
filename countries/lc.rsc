# MikroTik RouterOS address list for LC
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 20

/ip firewall address-list
add list="LC country" address=23.185.40.0/24 comment="LC"
add list="LC country" address=24.92.144.0/20 comment="LC"
add list="LC country" address=66.212.62.0/23 comment="LC"
add list="LC country" address=72.14.98.0/23 comment="LC"
add list="LC country" address=104.218.216.0/22 comment="LC"
add list="LC country" address=104.255.252.0/22 comment="LC"
add list="LC country" address=162.0.155.0/24 comment="LC"
add list="LC country" address=162.212.208.0/23 comment="LC"
add list="LC country" address=162.245.76.0/22 comment="LC"
add list="LC country" address=192.58.142.0/23 comment="LC"
add list="LC country" address=192.147.231.0/24 comment="LC"
add list="LC country" address=199.38.192.0/21 comment="LC"
add list="LC country" address=199.192.226.0/23 comment="LC"
add list="LC country" address=199.223.248.0/22 comment="LC"
add list="LC country" address=204.145.147.0/24 comment="LC"
add list="LC country" address=204.152.80.0/23 comment="LC"
add list="LC country" address=205.166.35.0/24 comment="LC"
add list="LC country" address=206.126.120.0/21 comment="LC"
add list="LC country" address=207.191.248.0/21 comment="LC"
add list="LC country" address=208.94.176.0/21 comment="LC"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="LC country" log=yes
# add action=drop chain=forward src-address-list="LC country" log=yes
