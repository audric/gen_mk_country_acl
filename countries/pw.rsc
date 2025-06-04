# MikroTik RouterOS address list for PW
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 4

/ip firewall address-list
add list="PW country" address=103.30.248.0/22 comment="PW"
add list="PW country" address=103.159.28.0/23 comment="PW"
add list="PW country" address=103.251.132.0/23 comment="PW"
add list="PW country" address=202.124.224.0/20 comment="PW"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="PW country" log=yes
# add action=drop chain=forward src-address-list="PW country" log=yes
