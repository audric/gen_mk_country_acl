# MikroTik RouterOS address list for NA
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 32

/ip firewall address-list
add list="NA country" address=41.63.192.0/18 comment="NA"
add list="NA country" address=41.182.0.0/16 comment="NA"
add list="NA country" address=41.190.84.0/22 comment="NA"
add list="NA country" address=41.190.96.0/19 comment="NA"
add list="NA country" address=41.205.128.0/19 comment="NA"
add list="NA country" address=41.219.64.0/18 comment="NA"
add list="NA country" address=41.223.80.0/22 comment="NA"
add list="NA country" address=102.69.212.0/22 comment="NA"
add list="NA country" address=102.206.108.0/22 comment="NA"
add list="NA country" address=102.209.196.0/22 comment="NA"
add list="NA country" address=102.209.244.0/22 comment="NA"
add list="NA country" address=102.213.184.0/22 comment="NA"
add list="NA country" address=102.214.132.0/22 comment="NA"
add list="NA country" address=102.214.212.0/22 comment="NA"
add list="NA country" address=102.215.104.0/22 comment="NA"
add list="NA country" address=105.232.0.0/16 comment="NA"
add list="NA country" address=154.0.192.0/18 comment="NA"
add list="NA country" address=164.160.108.0/22 comment="NA"
add list="NA country" address=196.3.94.0/24 comment="NA"
add list="NA country" address=196.12.10.0/24 comment="NA"
add list="NA country" address=196.20.0.0/19 comment="NA"
add list="NA country" address=196.44.128.0/19 comment="NA"
add list="NA country" address=196.46.28.0/24 comment="NA"
add list="NA country" address=196.49.2.0/24 comment="NA"
add list="NA country" address=196.216.164.0/22 comment="NA"
add list="NA country" address=196.216.207.0/24 comment="NA"
add list="NA country" address=196.223.18.0/24 comment="NA"
add list="NA country" address=196.223.35.0/24 comment="NA"
add list="NA country" address=197.188.0.0/16 comment="NA"
add list="NA country" address=197.233.0.0/16 comment="NA"
add list="NA country" address=197.243.128.0/17 comment="NA"
add list="NA country" address=204.152.14.0/23 comment="NA"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="NA country" log=yes
# add action=drop chain=forward src-address-list="NA country" log=yes
