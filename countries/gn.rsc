# MikroTik RouterOS address list for GN
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 23

/ip firewall address-list
add list="GN country" address=41.77.184.0/21 comment="GN"
add list="GN country" address=41.79.200.0/22 comment="GN"
add list="GN country" address=41.79.236.0/22 comment="GN"
add list="GN country" address=41.191.220.0/22 comment="GN"
add list="GN country" address=41.223.48.0/22 comment="GN"
add list="GN country" address=41.242.88.0/22 comment="GN"
add list="GN country" address=45.220.52.0/22 comment="GN"
add list="GN country" address=102.176.160.0/20 comment="GN"
add list="GN country" address=102.206.72.0/22 comment="GN"
add list="GN country" address=102.208.222.0/24 comment="GN"
add list="GN country" address=102.208.241.0/24 comment="GN"
add list="GN country" address=102.209.204.0/22 comment="GN"
add list="GN country" address=102.211.199.0/24 comment="GN"
add list="GN country" address=102.218.129.0/24 comment="GN"
add list="GN country" address=102.218.136.0/22 comment="GN"
add list="GN country" address=102.218.236.0/22 comment="GN"
add list="GN country" address=160.119.128.0/21 comment="GN"
add list="GN country" address=196.41.90.0/24 comment="GN"
add list="GN country" address=196.49.40.0/24 comment="GN"
add list="GN country" address=196.49.64.0/24 comment="GN"
add list="GN country" address=196.60.38.0/24 comment="GN"
add list="GN country" address=196.60.61.0/24 comment="GN"
add list="GN country" address=197.149.192.0/18 comment="GN"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="GN country" log=yes
# add action=drop chain=forward src-address-list="GN country" log=yes
