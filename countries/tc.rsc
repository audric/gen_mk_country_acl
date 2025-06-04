# MikroTik RouterOS address list for TC
# Generated at: 2025-06-04 16:20:47 +0200
# Total CIDR blocks: 7

/ip firewall address-list
add list="TC country" address=65.255.48.0/20 comment="TC"
add list="TC country" address=142.54.204.0/22 comment="TC"
add list="TC country" address=192.203.37.0/24 comment="TC"
add list="TC country" address=199.103.28.0/22 comment="TC"
add list="TC country" address=199.182.192.0/22 comment="TC"
add list="TC country" address=204.13.104.0/22 comment="TC"
add list="TC country" address=204.110.56.0/21 comment="TC"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="TC country" log=yes
# add action=drop chain=forward src-address-list="TC country" log=yes
