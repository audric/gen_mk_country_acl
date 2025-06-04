# MikroTik RouterOS address list for NC
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 42

/ip firewall address-list
add list="NC country" address=27.122.0.0/22 comment="NC"
add list="NC country" address=43.224.192.0/22 comment="NC"
add list="NC country" address=43.245.212.0/22 comment="NC"
add list="NC country" address=43.255.236.0/22 comment="NC"
add list="NC country" address=45.114.232.0/23 comment="NC"
add list="NC country" address=61.5.208.0/20 comment="NC"
add list="NC country" address=101.101.0.0/18 comment="NC"
add list="NC country" address=103.2.184.0/22 comment="NC"
add list="NC country" address=103.17.44.0/22 comment="NC"
add list="NC country" address=103.23.52.0/22 comment="NC"
add list="NC country" address=103.24.112.0/22 comment="NC"
add list="NC country" address=103.29.152.0/22 comment="NC"
add list="NC country" address=103.43.156.0/22 comment="NC"
add list="NC country" address=103.105.191.0/24 comment="NC"
add list="NC country" address=103.123.232.0/23 comment="NC"
add list="NC country" address=103.152.32.0/24 comment="NC"
add list="NC country" address=103.173.58.0/23 comment="NC"
add list="NC country" address=113.20.32.0/19 comment="NC"
add list="NC country" address=113.21.96.0/19 comment="NC"
add list="NC country" address=114.69.176.0/20 comment="NC"
add list="NC country" address=114.69.192.0/19 comment="NC"
add list="NC country" address=115.126.160.0/19 comment="NC"
add list="NC country" address=118.179.224.0/19 comment="NC"
add list="NC country" address=163.47.224.0/22 comment="NC"
add list="NC country" address=163.47.248.0/22 comment="NC"
add list="NC country" address=175.158.128.0/18 comment="NC"
add list="NC country" address=180.214.96.0/19 comment="NC"
add list="NC country" address=202.0.156.0/22 comment="NC"
add list="NC country" address=202.22.128.0/19 comment="NC"
add list="NC country" address=202.22.224.0/20 comment="NC"
add list="NC country" address=202.87.128.0/19 comment="NC"
add list="NC country" address=202.166.176.0/21 comment="NC"
add list="NC country" address=202.171.64.0/20 comment="NC"
add list="NC country" address=203.20.74.0/23 comment="NC"
add list="NC country" address=203.34.36.0/24 comment="NC"
add list="NC country" address=203.80.48.0/21 comment="NC"
add list="NC country" address=203.104.48.0/20 comment="NC"
add list="NC country" address=203.147.64.0/20 comment="NC"
add list="NC country" address=203.147.80.0/21 comment="NC"
add list="NC country" address=220.156.160.0/20 comment="NC"
add list="NC country" address=223.29.128.0/19 comment="NC"
add list="NC country" address=223.29.160.0/20 comment="NC"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="NC country" log=yes
# add action=drop chain=forward src-address-list="NC country" log=yes
