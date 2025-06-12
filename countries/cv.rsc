# MikroTik RouterOS address list for CV
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 23

/ip firewall address-list
add list="CV country" address=41.74.128.0/20 comment="CV"
add list="CV country" address=41.79.124.0/22 comment="CV"
add list="CV country" address=41.215.208.0/20 comment="CV"
add list="CV country" address=41.221.192.0/20 comment="CV"
add list="CV country" address=102.69.151.0/24 comment="CV"
add list="CV country" address=102.207.152.0/22 comment="CV"
add list="CV country" address=102.209.52.0/22 comment="CV"
add list="CV country" address=102.209.160.0/22 comment="CV"
add list="CV country" address=102.211.8.0/22 comment="CV"
add list="CV country" address=102.212.81.0/24 comment="CV"
add list="CV country" address=102.212.175.0/24 comment="CV"
add list="CV country" address=102.213.204.0/22 comment="CV"
add list="CV country" address=102.214.188.0/24 comment="CV"
add list="CV country" address=102.216.132.0/24 comment="CV"
add list="CV country" address=102.219.86.0/23 comment="CV"
add list="CV country" address=102.220.164.0/22 comment="CV"
add list="CV country" address=102.222.140.0/22 comment="CV"
add list="CV country" address=165.90.96.0/19 comment="CV"
add list="CV country" address=169.239.12.0/22 comment="CV"
add list="CV country" address=196.49.96.0/24 comment="CV"
add list="CV country" address=196.60.112.0/24 comment="CV"
add list="CV country" address=197.255.128.0/20 comment="CV"
add list="CV country" address=213.150.192.0/21 comment="CV"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="CV country" comment="Allow CV traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="CV country" comment="Block CV traffic"
