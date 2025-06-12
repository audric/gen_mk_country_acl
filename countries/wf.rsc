# MikroTik RouterOS address list for WF
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 3

/ip firewall address-list
add list="WF country" address=27.125.192.0/22 comment="WF"
add list="WF country" address=103.235.110.0/23 comment="WF"
add list="WF country" address=117.20.32.0/21 comment="WF"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="WF country" comment="Allow WF traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="WF country" comment="Block WF traffic"
