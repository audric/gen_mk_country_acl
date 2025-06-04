# MikroTik RouterOS address list for MQ
# Generated at: 2025-06-04 16:20:47 +0200
# Total CIDR blocks: 21

/ip firewall address-list
add list="MQ country" address=5.102.72.0/21 comment="MQ"
add list="MQ country" address=80.243.240.0/20 comment="MQ"
add list="MQ country" address=82.197.96.0/19 comment="MQ"
add list="MQ country" address=89.16.0.0/19 comment="MQ"
add list="MQ country" address=92.49.64.0/18 comment="MQ"
add list="MQ country" address=93.176.0.0/18 comment="MQ"
add list="MQ country" address=94.124.152.0/21 comment="MQ"
add list="MQ country" address=94.124.216.0/21 comment="MQ"
add list="MQ country" address=94.198.176.0/21 comment="MQ"
add list="MQ country" address=104.245.112.0/21 comment="MQ"
add list="MQ country" address=104.249.191.0/24 comment="MQ"
add list="MQ country" address=109.62.0.0/17 comment="MQ"
add list="MQ country" address=109.203.224.0/19 comment="MQ"
add list="MQ country" address=185.13.216.0/22 comment="MQ"
add list="MQ country" address=185.14.99.0/24 comment="MQ"
add list="MQ country" address=185.21.212.0/22 comment="MQ"
add list="MQ country" address=185.60.232.0/22 comment="MQ"
add list="MQ country" address=185.91.232.0/22 comment="MQ"
add list="MQ country" address=188.115.64.0/18 comment="MQ"
add list="MQ country" address=192.163.24.0/22 comment="MQ"
add list="MQ country" address=217.175.160.0/19 comment="MQ"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="MQ country" log=yes
# add action=drop chain=forward src-address-list="MQ country" log=yes
