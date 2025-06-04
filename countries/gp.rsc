# MikroTik RouterOS address list for GP
# Generated at: 2025-06-04 16:20:47 +0200
# Total CIDR blocks: 15

/ip firewall address-list
add list="GP country" address=5.187.96.0/19 comment="GP"
add list="GP country" address=46.238.128.0/18 comment="GP"
add list="GP country" address=93.121.128.0/17 comment="GP"
add list="GP country" address=95.138.0.0/17 comment="GP"
add list="GP country" address=104.250.0.0/19 comment="GP"
add list="GP country" address=107.191.208.0/20 comment="GP"
add list="GP country" address=185.29.48.0/22 comment="GP"
add list="GP country" address=193.218.114.0/24 comment="GP"
add list="GP country" address=199.91.160.0/22 comment="GP"
add list="GP country" address=207.90.254.0/23 comment="GP"
add list="GP country" address=208.72.228.0/22 comment="GP"
add list="GP country" address=208.79.96.0/22 comment="GP"
add list="GP country" address=208.94.168.0/22 comment="GP"
add list="GP country" address=213.16.0.0/19 comment="GP"
add list="GP country" address=213.188.160.0/19 comment="GP"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="GP country" log=yes
# add action=drop chain=forward src-address-list="GP country" log=yes
