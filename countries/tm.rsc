# MikroTik RouterOS address list for TM
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 9

/ip firewall address-list
add list="TM country" address=77.83.59.0/24 comment="TM"
add list="TM country" address=95.85.96.0/19 comment="TM"
add list="TM country" address=103.220.0.0/22 comment="TM"
add list="TM country" address=119.235.112.0/20 comment="TM"
add list="TM country" address=177.93.143.0/24 comment="TM"
add list="TM country" address=185.69.184.0/22 comment="TM"
add list="TM country" address=185.246.72.0/22 comment="TM"
add list="TM country" address=216.250.8.0/21 comment="TM"
add list="TM country" address=217.174.224.0/20 comment="TM"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="TM country" log=yes
# add action=drop chain=forward src-address-list="TM country" log=yes
