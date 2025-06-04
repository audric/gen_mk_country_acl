# MikroTik RouterOS address list for JE
# Generated at: 2025-06-04 16:20:47 +0200
# Total CIDR blocks: 41

/ip firewall address-list
add list="JE country" address=5.35.160.0/21 comment="JE"
add list="JE country" address=5.42.128.0/21 comment="JE"
add list="JE country" address=31.186.112.0/21 comment="JE"
add list="JE country" address=37.156.38.0/23 comment="JE"
add list="JE country" address=46.254.248.0/21 comment="JE"
add list="JE country" address=81.20.176.0/20 comment="JE"
add list="JE country" address=82.112.128.0/19 comment="JE"
add list="JE country" address=83.137.248.0/21 comment="JE"
add list="JE country" address=87.237.128.0/21 comment="JE"
add list="JE country" address=87.244.64.0/18 comment="JE"
add list="JE country" address=93.191.200.0/21 comment="JE"
add list="JE country" address=103.105.148.0/22 comment="JE"
add list="JE country" address=109.68.192.0/22 comment="JE"
add list="JE country" address=146.19.127.0/24 comment="JE"
add list="JE country" address=165.250.0.0/16 comment="JE"
add list="JE country" address=173.255.144.0/21 comment="JE"
add list="JE country" address=185.3.52.0/22 comment="JE"
add list="JE country" address=185.16.68.0/22 comment="JE"
add list="JE country" address=185.48.60.0/22 comment="JE"
add list="JE country" address=185.57.212.0/22 comment="JE"
add list="JE country" address=185.87.8.0/22 comment="JE"
add list="JE country" address=185.113.12.0/22 comment="JE"
add list="JE country" address=185.122.244.0/22 comment="JE"
add list="JE country" address=185.158.120.0/22 comment="JE"
add list="JE country" address=185.179.101.0/24 comment="JE"
add list="JE country" address=185.206.12.0/22 comment="JE"
add list="JE country" address=185.235.244.0/24 comment="JE"
add list="JE country" address=188.116.44.0/24 comment="JE"
add list="JE country" address=193.3.239.0/24 comment="JE"
add list="JE country" address=193.17.36.0/22 comment="JE"
add list="JE country" address=193.36.44.0/24 comment="JE"
add list="JE country" address=193.201.42.0/24 comment="JE"
add list="JE country" address=194.34.106.0/23 comment="JE"
add list="JE country" address=199.34.116.0/22 comment="JE"
add list="JE country" address=199.66.128.0/22 comment="JE"
add list="JE country" address=203.30.195.0/24 comment="JE"
add list="JE country" address=209.251.252.0/23 comment="JE"
add list="JE country" address=212.9.0.0/19 comment="JE"
add list="JE country" address=213.133.192.0/19 comment="JE"
add list="JE country" address=213.134.23.0/24 comment="JE"
add list="JE country" address=217.198.188.0/24 comment="JE"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="JE country" log=yes
# add action=drop chain=forward src-address-list="JE country" log=yes
