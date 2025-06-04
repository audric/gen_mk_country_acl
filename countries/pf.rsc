# MikroTik RouterOS address list for PF
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 19

/ip firewall address-list
add list="PF country" address=43.249.176.0/22 comment="PF"
add list="PF country" address=50.21.80.0/20 comment="PF"
add list="PF country" address=64.140.144.0/20 comment="PF"
add list="PF country" address=103.4.72.0/22 comment="PF"
add list="PF country" address=103.46.216.0/22 comment="PF"
add list="PF country" address=103.129.120.0/22 comment="PF"
add list="PF country" address=103.166.70.0/23 comment="PF"
add list="PF country" address=103.254.224.0/22 comment="PF"
add list="PF country" address=103.254.232.0/22 comment="PF"
add list="PF country" address=113.197.68.0/22 comment="PF"
add list="PF country" address=114.141.112.0/21 comment="PF"
add list="PF country" address=123.50.64.0/18 comment="PF"
add list="PF country" address=148.66.64.0/18 comment="PF"
add list="PF country" address=192.171.104.0/21 comment="PF"
add list="PF country" address=202.3.224.0/19 comment="PF"
add list="PF country" address=202.90.64.0/19 comment="PF"
add list="PF country" address=203.185.160.0/20 comment="PF"
add list="PF country" address=203.185.176.0/21 comment="PF"
add list="PF country" address=218.100.77.0/24 comment="PF"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="PF country" log=yes
# add action=drop chain=forward src-address-list="PF country" log=yes
