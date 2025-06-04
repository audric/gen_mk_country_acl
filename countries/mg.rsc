# MikroTik RouterOS address list for MG
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 25

/ip firewall address-list
add list="MG country" address=41.63.128.0/19 comment="MG"
add list="MG country" address=41.74.16.0/20 comment="MG"
add list="MG country" address=41.74.208.0/20 comment="MG"
add list="MG country" address=41.77.16.0/21 comment="MG"
add list="MG country" address=41.188.0.0/18 comment="MG"
add list="MG country" address=41.190.236.0/22 comment="MG"
add list="MG country" address=41.204.96.0/19 comment="MG"
add list="MG country" address=41.207.32.0/19 comment="MG"
add list="MG country" address=41.242.96.0/20 comment="MG"
add list="MG country" address=102.16.0.0/14 comment="MG"
add list="MG country" address=102.20.0.0/15 comment="MG"
add list="MG country" address=102.68.192.0/18 comment="MG"
add list="MG country" address=102.211.100.0/22 comment="MG"
add list="MG country" address=102.216.23.0/24 comment="MG"
add list="MG country" address=154.120.128.0/18 comment="MG"
add list="MG country" address=154.126.0.0/17 comment="MG"
add list="MG country" address=196.43.214.0/24 comment="MG"
add list="MG country" address=196.49.13.0/24 comment="MG"
add list="MG country" address=196.192.32.0/20 comment="MG"
add list="MG country" address=196.223.41.0/24 comment="MG"
add list="MG country" address=197.148.128.0/18 comment="MG"
add list="MG country" address=197.149.0.0/18 comment="MG"
add list="MG country" address=197.158.64.0/18 comment="MG"
add list="MG country" address=197.159.144.0/20 comment="MG"
add list="MG country" address=197.215.192.0/20 comment="MG"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="MG country" log=yes
# add action=drop chain=forward src-address-list="MG country" log=yes
