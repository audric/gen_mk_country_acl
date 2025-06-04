# MikroTik RouterOS address list for BN
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 35

/ip firewall address-list
add list="BN country" address=43.225.40.0/22 comment="BN"
add list="BN country" address=43.225.136.0/22 comment="BN"
add list="BN country" address=43.251.128.0/22 comment="BN"
add list="BN country" address=45.126.140.0/22 comment="BN"
add list="BN country" address=45.127.140.0/22 comment="BN"
add list="BN country" address=58.97.144.0/20 comment="BN"
add list="BN country" address=61.6.192.0/18 comment="BN"
add list="BN country" address=103.4.188.0/22 comment="BN"
add list="BN country" address=103.12.208.0/23 comment="BN"
add list="BN country" address=103.16.120.0/22 comment="BN"
add list="BN country" address=103.17.24.0/22 comment="BN"
add list="BN country" address=103.18.172.0/22 comment="BN"
add list="BN country" address=103.20.24.0/22 comment="BN"
add list="BN country" address=103.42.208.0/22 comment="BN"
add list="BN country" address=103.139.109.0/24 comment="BN"
add list="BN country" address=103.162.82.0/24 comment="BN"
add list="BN country" address=103.170.170.0/24 comment="BN"
add list="BN country" address=103.224.96.0/22 comment="BN"
add list="BN country" address=103.230.64.0/22 comment="BN"
add list="BN country" address=118.103.248.0/21 comment="BN"
add list="BN country" address=119.160.128.0/18 comment="BN"
add list="BN country" address=139.5.184.0/22 comment="BN"
add list="BN country" address=156.31.0.0/16 comment="BN"
add list="BN country" address=158.161.0.0/16 comment="BN"
add list="BN country" address=185.8.100.0/22 comment="BN"
add list="BN country" address=185.100.40.0/22 comment="BN"
add list="BN country" address=192.94.122.0/24 comment="BN"
add list="BN country" address=195.128.4.0/22 comment="BN"
add list="BN country" address=202.59.230.0/24 comment="BN"
add list="BN country" address=202.86.24.0/21 comment="BN"
add list="BN country" address=202.90.36.0/24 comment="BN"
add list="BN country" address=202.93.208.0/20 comment="BN"
add list="BN country" address=202.152.64.0/19 comment="BN"
add list="BN country" address=202.160.0.0/19 comment="BN"
add list="BN country" address=202.160.32.0/20 comment="BN"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="BN country" log=yes
# add action=drop chain=forward src-address-list="BN country" log=yes
