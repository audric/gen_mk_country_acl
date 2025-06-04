# MikroTik RouterOS address list for BB
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 30

/ip firewall address-list
add list="BB country" address=23.236.0.0/20 comment="BB"
add list="BB country" address=64.119.192.0/20 comment="BB"
add list="BB country" address=65.48.128.0/17 comment="BB"
add list="BB country" address=69.73.192.0/18 comment="BB"
add list="BB country" address=69.80.0.0/18 comment="BB"
add list="BB country" address=72.22.128.0/19 comment="BB"
add list="BB country" address=72.51.64.0/18 comment="BB"
add list="BB country" address=104.153.128.0/21 comment="BB"
add list="BB country" address=104.200.96.0/20 comment="BB"
add list="BB country" address=104.218.176.0/22 comment="BB"
add list="BB country" address=162.212.12.0/22 comment="BB"
add list="BB country" address=162.220.136.0/21 comment="BB"
add list="BB country" address=162.246.104.0/21 comment="BB"
add list="BB country" address=192.65.160.0/21 comment="BB"
add list="BB country" address=192.171.120.0/21 comment="BB"
add list="BB country" address=192.214.112.0/20 comment="BB"
add list="BB country" address=192.235.48.0/20 comment="BB"
add list="BB country" address=196.1.160.0/20 comment="BB"
add list="BB country" address=196.3.192.0/19 comment="BB"
add list="BB country" address=198.56.56.0/21 comment="BB"
add list="BB country" address=198.245.160.0/24 comment="BB"
add list="BB country" address=198.246.229.0/24 comment="BB"
add list="BB country" address=198.246.230.0/24 comment="BB"
add list="BB country" address=199.7.112.0/21 comment="BB"
add list="BB country" address=199.47.52.0/22 comment="BB"
add list="BB country" address=199.58.152.0/22 comment="BB"
add list="BB country" address=199.254.104.0/21 comment="BB"
add list="BB country" address=200.50.64.0/19 comment="BB"
add list="BB country" address=205.214.192.0/19 comment="BB"
add list="BB country" address=216.110.96.0/19 comment="BB"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="BB country" log=yes
# add action=drop chain=forward src-address-list="BB country" log=yes
