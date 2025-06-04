# MikroTik RouterOS address list for BI
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 13

/ip firewall address-list
add list="BI country" address=41.79.44.0/22 comment="BI"
add list="BI country" address=41.79.224.0/22 comment="BI"
add list="BI country" address=102.134.96.0/20 comment="BI"
add list="BI country" address=154.73.40.0/22 comment="BI"
add list="BI country" address=154.73.104.0/22 comment="BI"
add list="BI country" address=154.117.192.0/18 comment="BI"
add list="BI country" address=154.119.0.0/19 comment="BI"
add list="BI country" address=196.2.8.0/21 comment="BI"
add list="BI country" address=196.13.223.0/24 comment="BI"
add list="BI country" address=196.49.3.0/24 comment="BI"
add list="BI country" address=196.223.3.0/24 comment="BI"
add list="BI country" address=196.223.36.0/24 comment="BI"
add list="BI country" address=197.157.192.0/22 comment="BI"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="BI country" log=yes
# add action=drop chain=forward src-address-list="BI country" log=yes
