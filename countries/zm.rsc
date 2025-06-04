# MikroTik RouterOS address list for ZM
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 37

/ip firewall address-list
add list="ZM country" address=41.63.0.0/18 comment="ZM"
add list="ZM country" address=41.72.96.0/19 comment="ZM"
add list="ZM country" address=41.77.0.0/21 comment="ZM"
add list="ZM country" address=41.191.116.0/22 comment="ZM"
add list="ZM country" address=41.215.176.0/20 comment="ZM"
add list="ZM country" address=41.216.64.0/19 comment="ZM"
add list="ZM country" address=41.222.16.0/21 comment="ZM"
add list="ZM country" address=41.223.116.0/22 comment="ZM"
add list="ZM country" address=45.212.0.0/14 comment="ZM"
add list="ZM country" address=80.88.3.0/24 comment="ZM"
add list="ZM country" address=102.23.120.0/22 comment="ZM"
add list="ZM country" address=102.67.160.0/22 comment="ZM"
add list="ZM country" address=102.68.136.0/22 comment="ZM"
add list="ZM country" address=102.130.100.0/24 comment="ZM"
add list="ZM country" address=102.144.0.0/13 comment="ZM"
add list="ZM country" address=102.208.220.0/23 comment="ZM"
add list="ZM country" address=102.210.96.0/22 comment="ZM"
add list="ZM country" address=102.210.102.0/23 comment="ZM"
add list="ZM country" address=102.210.160.0/22 comment="ZM"
add list="ZM country" address=102.212.180.0/22 comment="ZM"
add list="ZM country" address=102.216.214.0/23 comment="ZM"
add list="ZM country" address=102.220.158.0/23 comment="ZM"
add list="ZM country" address=102.221.240.0/22 comment="ZM"
add list="ZM country" address=154.73.232.0/22 comment="ZM"
add list="ZM country" address=155.0.0.0/16 comment="ZM"
add list="ZM country" address=165.56.0.0/13 comment="ZM"
add list="ZM country" address=196.12.12.0/22 comment="ZM"
add list="ZM country" address=196.13.104.0/24 comment="ZM"
add list="ZM country" address=196.46.192.0/19 comment="ZM"
add list="ZM country" address=196.49.88.0/24 comment="ZM"
add list="ZM country" address=196.60.94.0/24 comment="ZM"
add list="ZM country" address=196.223.2.0/24 comment="ZM"
add list="ZM country" address=196.223.29.0/24 comment="ZM"
add list="ZM country" address=197.212.0.0/15 comment="ZM"
add list="ZM country" address=197.220.0.0/19 comment="ZM"
add list="ZM country" address=197.231.244.0/22 comment="ZM"
add list="ZM country" address=213.193.32.0/21 comment="ZM"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="ZM country" log=yes
# add action=drop chain=forward src-address-list="ZM country" log=yes
