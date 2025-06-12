# MikroTik RouterOS address list for EU
# Generated at: 2025-06-12 09:46:56 +0200
# Total CIDR blocks: 10

/ip firewall address-list
add list="EU country" address=138.199.64.0/20 comment="EU"
add list="EU country" address=139.191.0.0/16 comment="EU"
add list="EU country" address=144.44.0.0/16 comment="EU"
add list="EU country" address=145.218.0.0/16 comment="EU"
add list="EU country" address=151.175.0.0/16 comment="EU"
add list="EU country" address=158.67.0.0/16 comment="EU"
add list="EU country" address=192.84.203.0/24 comment="EU"
add list="EU country" address=192.108.27.0/24 comment="EU"
add list="EU country" address=192.108.28.0/23 comment="EU"
add list="EU country" address=192.108.30.0/24 comment="EU"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="EU country" comment="Allow EU traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="EU country" comment="Block EU traffic"
