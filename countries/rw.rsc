# MikroTik RouterOS address list for RW
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 29

/ip firewall address-list
add list="RW country" address=41.74.160.0/20 comment="RW"
add list="RW country" address=41.138.80.0/21 comment="RW"
add list="RW country" address=41.186.0.0/16 comment="RW"
add list="RW country" address=41.197.0.0/16 comment="RW"
add list="RW country" address=41.222.244.0/22 comment="RW"
add list="RW country" address=41.242.140.0/22 comment="RW"
add list="RW country" address=102.22.128.0/18 comment="RW"
add list="RW country" address=102.130.32.0/21 comment="RW"
add list="RW country" address=102.207.48.0/24 comment="RW"
add list="RW country" address=102.207.141.0/24 comment="RW"
add list="RW country" address=102.209.168.0/22 comment="RW"
add list="RW country" address=102.211.72.0/22 comment="RW"
add list="RW country" address=102.213.212.0/23 comment="RW"
add list="RW country" address=102.214.220.0/23 comment="RW"
add list="RW country" address=102.215.8.0/22 comment="RW"
add list="RW country" address=102.218.176.0/22 comment="RW"
add list="RW country" address=102.219.173.0/24 comment="RW"
add list="RW country" address=105.178.0.0/17 comment="RW"
add list="RW country" address=105.179.0.0/19 comment="RW"
add list="RW country" address=154.68.64.0/18 comment="RW"
add list="RW country" address=156.38.8.0/21 comment="RW"
add list="RW country" address=196.44.240.0/20 comment="RW"
add list="RW country" address=196.49.7.0/24 comment="RW"
add list="RW country" address=196.223.12.0/24 comment="RW"
add list="RW country" address=196.223.240.0/21 comment="RW"
add list="RW country" address=197.157.128.0/18 comment="RW"
add list="RW country" address=197.157.212.0/22 comment="RW"
add list="RW country" address=197.234.244.0/22 comment="RW"
add list="RW country" address=197.243.0.0/17 comment="RW"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="RW country" log=yes
# add action=drop chain=forward src-address-list="RW country" log=yes
