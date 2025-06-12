# MikroTik RouterOS address list for YE
# Generated at: 2025-06-12 09:46:56 +0200
# Total CIDR blocks: 29

/ip firewall address-list
add list="YE country" address=5.100.160.0/21 comment="YE"
add list="YE country" address=5.255.0.0/19 comment="YE"
add list="YE country" address=31.31.176.0/20 comment="YE"
add list="YE country" address=46.35.64.0/19 comment="YE"
add list="YE country" address=46.161.224.0/19 comment="YE"
add list="YE country" address=78.137.64.0/19 comment="YE"
add list="YE country" address=80.253.176.0/20 comment="YE"
add list="YE country" address=81.91.24.0/21 comment="YE"
add list="YE country" address=82.114.160.0/19 comment="YE"
add list="YE country" address=89.189.64.0/19 comment="YE"
add list="YE country" address=94.26.192.0/19 comment="YE"
add list="YE country" address=109.74.32.0/20 comment="YE"
add list="YE country" address=109.200.160.0/19 comment="YE"
add list="YE country" address=110.238.32.0/19 comment="YE"
add list="YE country" address=131.117.160.0/21 comment="YE"
add list="YE country" address=134.35.0.0/16 comment="YE"
add list="YE country" address=175.110.0.0/18 comment="YE"
add list="YE country" address=176.123.16.0/20 comment="YE"
add list="YE country" address=178.130.64.0/18 comment="YE"
add list="YE country" address=185.11.8.0/22 comment="YE"
add list="YE country" address=185.71.132.0/22 comment="YE"
add list="YE country" address=185.80.44.0/22 comment="YE"
add list="YE country" address=185.80.140.0/22 comment="YE"
add list="YE country" address=185.112.200.0/22 comment="YE"
add list="YE country" address=185.240.64.0/22 comment="YE"
add list="YE country" address=188.209.224.0/19 comment="YE"
add list="YE country" address=188.240.96.0/19 comment="YE"
add list="YE country" address=195.94.0.0/19 comment="YE"
add list="YE country" address=213.246.0.0/19 comment="YE"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="YE country" comment="Allow YE traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="YE country" comment="Block YE traffic"
