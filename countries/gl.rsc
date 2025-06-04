# MikroTik RouterOS address list for GL
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 25

/ip firewall address-list
add list="GL country" address=37.18.44.0/22 comment="GL"
add list="GL country" address=37.230.164.0/22 comment="GL"
add list="GL country" address=37.230.214.0/23 comment="GL"
add list="GL country" address=37.230.216.0/22 comment="GL"
add list="GL country" address=37.230.220.0/23 comment="GL"
add list="GL country" address=46.16.16.0/21 comment="GL"
add list="GL country" address=46.243.151.0/24 comment="GL"
add list="GL country" address=88.83.0.0/19 comment="GL"
add list="GL country" address=128.0.70.0/24 comment="GL"
add list="GL country" address=178.170.132.0/22 comment="GL"
add list="GL country" address=178.170.147.0/24 comment="GL"
add list="GL country" address=178.170.160.0/22 comment="GL"
add list="GL country" address=178.170.199.0/24 comment="GL"
add list="GL country" address=178.170.200.0/22 comment="GL"
add list="GL country" address=178.170.204.0/23 comment="GL"
add list="GL country" address=178.170.210.0/23 comment="GL"
add list="GL country" address=178.170.212.0/22 comment="GL"
add list="GL country" address=178.170.216.0/24 comment="GL"
add list="GL country" address=185.18.188.0/22 comment="GL"
add list="GL country" address=185.21.228.0/22 comment="GL"
add list="GL country" address=185.57.160.0/22 comment="GL"
add list="GL country" address=185.93.20.0/22 comment="GL"
add list="GL country" address=185.157.200.0/22 comment="GL"
add list="GL country" address=188.72.71.0/24 comment="GL"
add list="GL country" address=194.177.224.0/19 comment="GL"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="GL country" log=yes
# add action=drop chain=forward src-address-list="GL country" log=yes
