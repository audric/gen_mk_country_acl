# MikroTik RouterOS address list for IO
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 2

/ip firewall address-list
add list="IO country" address=202.44.112.0/22 comment="IO"
add list="IO country" address=203.83.48.0/21 comment="IO"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="IO country" log=yes
# add action=drop chain=forward src-address-list="IO country" log=yes
