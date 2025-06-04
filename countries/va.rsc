# MikroTik RouterOS address list for VA
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 4

/ip firewall address-list
add list="VA country" address=185.17.220.0/22 comment="VA"
add list="VA country" address=185.152.68.0/22 comment="VA"
add list="VA country" address=193.43.102.0/23 comment="VA"
add list="VA country" address=212.77.0.0/19 comment="VA"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="VA country" log=yes
# add action=drop chain=forward src-address-list="VA country" log=yes
