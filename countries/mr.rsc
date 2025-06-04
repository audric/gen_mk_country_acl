# MikroTik RouterOS address list for MR
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 14

/ip firewall address-list
add list="MR country" address=41.138.128.0/19 comment="MR"
add list="MR country" address=41.188.64.0/18 comment="MR"
add list="MR country" address=41.223.96.0/22 comment="MR"
add list="MR country" address=82.151.64.0/19 comment="MR"
add list="MR country" address=102.206.224.0/22 comment="MR"
add list="MR country" address=102.214.128.0/22 comment="MR"
add list="MR country" address=102.214.208.0/22 comment="MR"
add list="MR country" address=102.215.95.0/24 comment="MR"
add list="MR country" address=102.216.27.0/24 comment="MR"
add list="MR country" address=102.216.216.0/22 comment="MR"
add list="MR country" address=102.219.207.0/24 comment="MR"
add list="MR country" address=196.49.18.0/24 comment="MR"
add list="MR country" address=196.223.45.0/24 comment="MR"
add list="MR country" address=197.231.0.0/19 comment="MR"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="MR country" log=yes
# add action=drop chain=forward src-address-list="MR country" log=yes
