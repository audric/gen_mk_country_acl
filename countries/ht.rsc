# MikroTik RouterOS address list for HT
# Generated at: 2025-06-12 09:46:56 +0200
# Total CIDR blocks: 21

/ip firewall address-list
add list="HT country" address=148.102.128.0/17 comment="HT"
add list="HT country" address=161.0.128.0/19 comment="HT"
add list="HT country" address=168.197.100.0/22 comment="HT"
add list="HT country" address=170.80.248.0/22 comment="HT"
add list="HT country" address=170.83.192.0/22 comment="HT"
add list="HT country" address=170.239.12.0/22 comment="HT"
add list="HT country" address=179.51.206.0/24 comment="HT"
add list="HT country" address=186.1.192.0/20 comment="HT"
add list="HT country" address=186.190.0.0/17 comment="HT"
add list="HT country" address=190.102.64.0/19 comment="HT"
add list="HT country" address=190.105.172.0/22 comment="HT"
add list="HT country" address=190.115.128.0/18 comment="HT"
add list="HT country" address=190.120.192.0/19 comment="HT"
add list="HT country" address=190.196.192.0/20 comment="HT"
add list="HT country" address=200.0.18.0/24 comment="HT"
add list="HT country" address=200.2.128.0/19 comment="HT"
add list="HT country" address=200.4.160.0/19 comment="HT"
add list="HT country" address=200.113.192.0/18 comment="HT"
add list="HT country" address=200.115.182.0/23 comment="HT"
add list="HT country" address=201.131.77.0/24 comment="HT"
add list="HT country" address=201.150.104.0/22 comment="HT"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="HT country" comment="Allow HT traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="HT country" comment="Block HT traffic"
