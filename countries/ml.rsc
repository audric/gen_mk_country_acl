# MikroTik RouterOS address list for ML
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 27

/ip firewall address-list
add list="ML country" address=41.73.96.0/19 comment="ML"
add list="ML country" address=41.203.192.0/20 comment="ML"
add list="ML country" address=41.221.176.0/20 comment="ML"
add list="ML country" address=102.68.176.0/22 comment="ML"
add list="ML country" address=102.130.232.0/22 comment="ML"
add list="ML country" address=102.165.96.0/20 comment="ML"
add list="ML country" address=102.212.72.0/22 comment="ML"
add list="ML country" address=102.213.136.0/22 comment="ML"
add list="ML country" address=102.217.24.0/22 comment="ML"
add list="ML country" address=102.221.132.0/22 comment="ML"
add list="ML country" address=102.222.204.0/22 comment="ML"
add list="ML country" address=102.223.64.0/22 comment="ML"
add list="ML country" address=154.70.192.0/22 comment="ML"
add list="ML country" address=154.118.128.0/18 comment="ML"
add list="ML country" address=165.90.208.0/20 comment="ML"
add list="ML country" address=169.239.100.0/22 comment="ML"
add list="ML country" address=196.10.216.0/21 comment="ML"
add list="ML country" address=196.32.112.0/20 comment="ML"
add list="ML country" address=196.49.48.0/24 comment="ML"
add list="ML country" address=196.50.16.0/22 comment="ML"
add list="ML country" address=196.60.46.0/24 comment="ML"
add list="ML country" address=196.200.48.0/20 comment="ML"
add list="ML country" address=196.200.80.0/20 comment="ML"
add list="ML country" address=196.251.156.0/22 comment="ML"
add list="ML country" address=197.155.128.0/18 comment="ML"
add list="ML country" address=217.64.96.0/20 comment="ML"
add list="ML country" address=217.170.144.0/20 comment="ML"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="ML country" log=yes
# add action=drop chain=forward src-address-list="ML country" log=yes
