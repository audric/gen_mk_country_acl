# MikroTik RouterOS address list for ZW
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 37

/ip firewall address-list
add list="ZW country" address=41.57.64.0/20 comment="ZW"
add list="ZW country" address=41.78.76.0/22 comment="ZW"
add list="ZW country" address=41.79.28.0/22 comment="ZW"
add list="ZW country" address=41.79.56.0/22 comment="ZW"
add list="ZW country" address=41.79.188.0/22 comment="ZW"
add list="ZW country" address=41.85.192.0/19 comment="ZW"
add list="ZW country" address=41.190.32.0/19 comment="ZW"
add list="ZW country" address=41.191.232.0/21 comment="ZW"
add list="ZW country" address=41.220.16.0/20 comment="ZW"
add list="ZW country" address=41.221.144.0/20 comment="ZW"
add list="ZW country" address=102.128.76.0/22 comment="ZW"
add list="ZW country" address=102.165.112.0/22 comment="ZW"
add list="ZW country" address=102.177.72.0/22 comment="ZW"
add list="ZW country" address=102.177.192.0/21 comment="ZW"
add list="ZW country" address=102.207.50.0/23 comment="ZW"
add list="ZW country" address=102.210.112.0/22 comment="ZW"
add list="ZW country" address=102.212.220.0/22 comment="ZW"
add list="ZW country" address=102.212.231.0/24 comment="ZW"
add list="ZW country" address=102.213.40.0/22 comment="ZW"
add list="ZW country" address=102.217.48.0/22 comment="ZW"
add list="ZW country" address=102.218.12.0/22 comment="ZW"
add list="ZW country" address=154.73.80.0/22 comment="ZW"
add list="ZW country" address=154.119.80.0/20 comment="ZW"
add list="ZW country" address=168.253.32.0/19 comment="ZW"
add list="ZW country" address=169.239.24.0/22 comment="ZW"
add list="ZW country" address=196.4.80.0/24 comment="ZW"
add list="ZW country" address=196.29.32.0/21 comment="ZW"
add list="ZW country" address=196.41.88.0/24 comment="ZW"
add list="ZW country" address=196.43.96.0/19 comment="ZW"
add list="ZW country" address=196.43.199.0/24 comment="ZW"
add list="ZW country" address=196.44.176.0/20 comment="ZW"
add list="ZW country" address=196.49.46.0/24 comment="ZW"
add list="ZW country" address=196.60.44.0/24 comment="ZW"
add list="ZW country" address=196.216.224.0/23 comment="ZW"
add list="ZW country" address=196.220.96.0/19 comment="ZW"
add list="ZW country" address=197.157.204.0/22 comment="ZW"
add list="ZW country" address=197.221.224.0/19 comment="ZW"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="ZW country" log=yes
# add action=drop chain=forward src-address-list="ZW country" log=yes
