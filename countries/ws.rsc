# MikroTik RouterOS address list for WS
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 16

/ip firewall address-list
add list="WS country" address=43.241.164.0/22 comment="WS"
add list="WS country" address=103.9.228.0/22 comment="WS"
add list="WS country" address=103.55.178.0/24 comment="WS"
add list="WS country" address=103.63.27.0/24 comment="WS"
add list="WS country" address=103.131.62.0/23 comment="WS"
add list="WS country" address=103.143.149.0/24 comment="WS"
add list="WS country" address=103.154.194.0/23 comment="WS"
add list="WS country" address=110.5.112.0/22 comment="WS"
add list="WS country" address=123.176.72.0/21 comment="WS"
add list="WS country" address=160.25.96.0/23 comment="WS"
add list="WS country" address=182.50.72.0/22 comment="WS"
add list="WS country" address=182.50.168.0/22 comment="WS"
add list="WS country" address=202.4.32.0/19 comment="WS"
add list="WS country" address=202.87.208.0/22 comment="WS"
add list="WS country" address=203.99.156.0/22 comment="WS"
add list="WS country" address=203.99.255.0/24 comment="WS"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="WS country" comment="Allow WS traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="WS country" comment="Block WS traffic"
