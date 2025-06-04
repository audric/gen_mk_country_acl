# MikroTik RouterOS address list for LS
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 19

/ip firewall address-list
add list="LS country" address=41.76.16.0/21 comment="LS"
add list="LS country" address=41.191.200.0/21 comment="LS"
add list="LS country" address=41.203.176.0/20 comment="LS"
add list="LS country" address=64.57.112.0/20 comment="LS"
add list="LS country" address=102.36.240.0/22 comment="LS"
add list="LS country" address=102.214.112.0/22 comment="LS"
add list="LS country" address=129.232.0.0/17 comment="LS"
add list="LS country" address=154.66.108.0/22 comment="LS"
add list="LS country" address=156.0.0.0/18 comment="LS"
add list="LS country" address=196.4.255.0/24 comment="LS"
add list="LS country" address=196.11.175.0/24 comment="LS"
add list="LS country" address=196.43.249.0/24 comment="LS"
add list="LS country" address=196.202.240.0/21 comment="LS"
add list="LS country" address=196.223.24.0/24 comment="LS"
add list="LS country" address=197.155.192.0/20 comment="LS"
add list="LS country" address=197.189.128.0/18 comment="LS"
add list="LS country" address=197.220.128.0/19 comment="LS"
add list="LS country" address=197.231.32.0/19 comment="LS"
add list="LS country" address=197.254.128.0/18 comment="LS"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="LS country" log=yes
# add action=drop chain=forward src-address-list="LS country" log=yes
