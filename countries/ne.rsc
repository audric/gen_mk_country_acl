# MikroTik RouterOS address list for NE
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 12

/ip firewall address-list
add list="NE country" address=41.78.116.0/22 comment="NE"
add list="NE country" address=41.138.32.0/19 comment="NE"
add list="NE country" address=41.203.128.0/19 comment="NE"
add list="NE country" address=102.213.60.0/22 comment="NE"
add list="NE country" address=102.213.244.0/22 comment="NE"
add list="NE country" address=102.214.4.0/22 comment="NE"
add list="NE country" address=102.215.84.0/22 comment="NE"
add list="NE country" address=102.217.96.0/22 comment="NE"
add list="NE country" address=102.220.24.0/22 comment="NE"
add list="NE country" address=154.66.220.0/22 comment="NE"
add list="NE country" address=154.127.80.0/20 comment="NE"
add list="NE country" address=197.214.0.0/18 comment="NE"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="NE country" log=yes
# add action=drop chain=forward src-address-list="NE country" log=yes
