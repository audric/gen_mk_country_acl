# MikroTik RouterOS address list for DZ
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 32

/ip firewall address-list
add list="DZ country" address=41.96.0.0/12 comment="DZ"
add list="DZ country" address=41.200.0.0/15 comment="DZ"
add list="DZ country" address=41.220.144.0/20 comment="DZ"
add list="DZ country" address=41.221.16.0/20 comment="DZ"
add list="DZ country" address=41.223.236.0/22 comment="DZ"
add list="DZ country" address=80.88.12.0/22 comment="DZ"
add list="DZ country" address=80.246.0.0/20 comment="DZ"
add list="DZ country" address=80.249.64.0/20 comment="DZ"
add list="DZ country" address=102.207.216.0/22 comment="DZ"
add list="DZ country" address=102.213.56.0/22 comment="DZ"
add list="DZ country" address=102.218.188.0/22 comment="DZ"
add list="DZ country" address=102.220.28.0/22 comment="DZ"
add list="DZ country" address=105.96.0.0/12 comment="DZ"
add list="DZ country" address=105.235.128.0/20 comment="DZ"
add list="DZ country" address=129.45.0.0/17 comment="DZ"
add list="DZ country" address=154.73.92.0/22 comment="DZ"
add list="DZ country" address=154.121.0.0/16 comment="DZ"
add list="DZ country" address=154.240.0.0/12 comment="DZ"
add list="DZ country" address=168.253.96.0/20 comment="DZ"
add list="DZ country" address=192.52.232.0/24 comment="DZ"
add list="DZ country" address=192.245.148.0/24 comment="DZ"
add list="DZ country" address=193.41.146.0/23 comment="DZ"
add list="DZ country" address=193.194.64.0/19 comment="DZ"
add list="DZ country" address=195.24.80.0/21 comment="DZ"
add list="DZ country" address=195.39.218.0/23 comment="DZ"
add list="DZ country" address=196.20.64.0/18 comment="DZ"
add list="DZ country" address=196.29.40.0/22 comment="DZ"
add list="DZ country" address=196.41.224.0/19 comment="DZ"
add list="DZ country" address=197.112.0.0/13 comment="DZ"
add list="DZ country" address=197.140.0.0/14 comment="DZ"
add list="DZ country" address=197.200.0.0/13 comment="DZ"
add list="DZ country" address=213.179.160.0/19 comment="DZ"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="DZ country" comment="Allow DZ traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="DZ country" comment="Block DZ traffic"
