# MikroTik RouterOS address list for BT
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 42

/ip firewall address-list
add list="BT country" address=36.50.37.0/24 comment="BT"
add list="BT country" address=43.229.124.0/22 comment="BT"
add list="BT country" address=43.230.208.0/24 comment="BT"
add list="BT country" address=43.241.136.0/22 comment="BT"
add list="BT country" address=45.64.248.0/22 comment="BT"
add list="BT country" address=103.7.252.0/22 comment="BT"
add list="BT country" address=103.29.224.0/22 comment="BT"
add list="BT country" address=103.71.40.0/22 comment="BT"
add list="BT country" address=103.78.111.0/24 comment="BT"
add list="BT country" address=103.78.116.0/23 comment="BT"
add list="BT country" address=103.80.108.0/22 comment="BT"
add list="BT country" address=103.97.87.0/24 comment="BT"
add list="BT country" address=103.117.80.0/24 comment="BT"
add list="BT country" address=103.119.126.0/24 comment="BT"
add list="BT country" address=103.127.254.0/24 comment="BT"
add list="BT country" address=103.129.62.0/23 comment="BT"
add list="BT country" address=103.133.216.0/22 comment="BT"
add list="BT country" address=103.151.231.0/24 comment="BT"
add list="BT country" address=103.161.248.0/23 comment="BT"
add list="BT country" address=103.166.42.0/23 comment="BT"
add list="BT country" address=103.179.206.0/23 comment="BT"
add list="BT country" address=103.197.176.0/22 comment="BT"
add list="BT country" address=103.234.126.0/23 comment="BT"
add list="BT country" address=103.245.240.0/22 comment="BT"
add list="BT country" address=103.252.84.0/24 comment="BT"
add list="BT country" address=118.103.136.0/21 comment="BT"
add list="BT country" address=119.2.96.0/19 comment="BT"
add list="BT country" address=157.10.120.0/21 comment="BT"
add list="BT country" address=157.10.128.0/23 comment="BT"
add list="BT country" address=157.10.136.0/21 comment="BT"
add list="BT country" address=157.10.144.0/22 comment="BT"
add list="BT country" address=160.30.184.0/23 comment="BT"
add list="BT country" address=160.191.60.0/23 comment="BT"
add list="BT country" address=163.223.203.0/24 comment="BT"
add list="BT country" address=163.227.12.0/23 comment="BT"
add list="BT country" address=163.227.18.0/23 comment="BT"
add list="BT country" address=163.227.20.0/22 comment="BT"
add list="BT country" address=163.227.24.0/21 comment="BT"
add list="BT country" address=163.227.68.0/23 comment="BT"
add list="BT country" address=202.89.24.0/21 comment="BT"
add list="BT country" address=202.144.128.0/19 comment="BT"
add list="BT country" address=220.158.236.0/22 comment="BT"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="BT country" log=yes
# add action=drop chain=forward src-address-list="BT country" log=yes
