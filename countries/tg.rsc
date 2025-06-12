# MikroTik RouterOS address list for TG
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 16

/ip firewall address-list
add list="TG country" address=41.78.136.0/22 comment="TG"
add list="TG country" address=41.207.160.0/19 comment="TG"
add list="TG country" address=80.248.64.0/20 comment="TG"
add list="TG country" address=102.64.128.0/17 comment="TG"
add list="TG country" address=102.164.224.0/20 comment="TG"
add list="TG country" address=102.176.252.0/22 comment="TG"
add list="TG country" address=102.212.92.0/22 comment="TG"
add list="TG country" address=102.217.12.0/22 comment="TG"
add list="TG country" address=102.219.236.0/22 comment="TG"
add list="TG country" address=154.70.80.0/20 comment="TG"
add list="TG country" address=156.38.64.0/19 comment="TG"
add list="TG country" address=160.242.192.0/18 comment="TG"
add list="TG country" address=196.49.44.0/24 comment="TG"
add list="TG country" address=196.60.42.0/24 comment="TG"
add list="TG country" address=196.168.0.0/14 comment="TG"
add list="TG country" address=197.148.96.0/19 comment="TG"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="TG country" comment="Allow TG traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="TG country" comment="Block TG traffic"
