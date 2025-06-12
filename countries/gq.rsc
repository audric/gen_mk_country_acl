# MikroTik RouterOS address list for GQ
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 11

/ip firewall address-list
add list="GQ country" address=41.79.48.0/22 comment="GQ"
add list="GQ country" address=102.164.248.0/21 comment="GQ"
add list="GQ country" address=102.213.52.0/23 comment="GQ"
add list="GQ country" address=102.223.24.0/22 comment="GQ"
add list="GQ country" address=105.235.224.0/20 comment="GQ"
add list="GQ country" address=154.73.56.0/22 comment="GQ"
add list="GQ country" address=164.160.84.0/22 comment="GQ"
add list="GQ country" address=169.239.112.0/22 comment="GQ"
add list="GQ country" address=196.251.240.0/22 comment="GQ"
add list="GQ country" address=197.149.168.0/22 comment="GQ"
add list="GQ country" address=197.214.64.0/20 comment="GQ"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="GQ country" comment="Allow GQ traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="GQ country" comment="Block GQ traffic"
