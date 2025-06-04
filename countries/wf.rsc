# MikroTik RouterOS address list for WF
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 3

/ip firewall address-list
add list="WF country" address=27.125.192.0/22 comment="WF"
add list="WF country" address=103.235.110.0/23 comment="WF"
add list="WF country" address=117.20.32.0/21 comment="WF"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="WF country" log=yes
# add action=drop chain=forward src-address-list="WF country" log=yes
