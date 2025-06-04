# MikroTik RouterOS address list for BS
# Generated at: 2025-06-04 16:20:47 +0200
# Total CIDR blocks: 26

/ip firewall address-list
add list="BS country" address=23.128.212.0/24 comment="BS"
add list="BS country" address=23.185.48.0/24 comment="BS"
add list="BS country" address=23.190.112.0/24 comment="BS"
add list="BS country" address=24.51.64.0/18 comment="BS"
add list="BS country" address=24.206.0.0/19 comment="BS"
add list="BS country" address=24.231.32.0/19 comment="BS"
add list="BS country" address=24.244.128.0/18 comment="BS"
add list="BS country" address=64.66.0.0/20 comment="BS"
add list="BS country" address=64.150.192.0/18 comment="BS"
add list="BS country" address=65.75.64.0/18 comment="BS"
add list="BS country" address=66.85.2.0/24 comment="BS"
add list="BS country" address=66.226.160.0/19 comment="BS"
add list="BS country" address=69.4.160.0/20 comment="BS"
add list="BS country" address=104.166.32.0/20 comment="BS"
add list="BS country" address=108.60.224.0/19 comment="BS"
add list="BS country" address=141.193.84.0/22 comment="BS"
add list="BS country" address=161.199.175.0/24 comment="BS"
add list="BS country" address=165.140.144.0/22 comment="BS"
add list="BS country" address=170.117.211.0/24 comment="BS"
add list="BS country" address=192.231.36.0/24 comment="BS"
add list="BS country" address=199.102.188.0/22 comment="BS"
add list="BS country" address=204.236.64.0/18 comment="BS"
add list="BS country" address=208.87.32.0/21 comment="BS"
add list="BS country" address=209.126.78.0/24 comment="BS"
add list="BS country" address=216.137.0.0/20 comment="BS"
add list="BS country" address=216.181.104.0/23 comment="BS"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="BS country" log=yes
# add action=drop chain=forward src-address-list="BS country" log=yes
