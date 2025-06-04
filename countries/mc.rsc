# MikroTik RouterOS address list for MC
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 22

/ip firewall address-list
add list="MC country" address=37.44.224.0/22 comment="MC"
add list="MC country" address=80.94.96.0/20 comment="MC"
add list="MC country" address=82.113.0.0/19 comment="MC"
add list="MC country" address=87.238.104.0/21 comment="MC"
add list="MC country" address=87.254.224.0/19 comment="MC"
add list="MC country" address=88.209.64.0/18 comment="MC"
add list="MC country" address=91.199.109.0/24 comment="MC"
add list="MC country" address=91.213.192.0/24 comment="MC"
add list="MC country" address=91.230.188.0/24 comment="MC"
add list="MC country" address=176.114.96.0/20 comment="MC"
add list="MC country" address=176.121.52.0/22 comment="MC"
add list="MC country" address=185.47.116.0/22 comment="MC"
add list="MC country" address=185.162.120.0/22 comment="MC"
add list="MC country" address=185.193.108.0/22 comment="MC"
add list="MC country" address=185.243.3.0/24 comment="MC"
add list="MC country" address=185.250.4.0/22 comment="MC"
add list="MC country" address=188.191.136.0/21 comment="MC"
add list="MC country" address=193.34.228.0/23 comment="MC"
add list="MC country" address=193.35.2.0/23 comment="MC"
add list="MC country" address=195.20.192.0/23 comment="MC"
add list="MC country" address=195.78.0.0/19 comment="MC"
add list="MC country" address=213.133.72.0/21 comment="MC"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="MC country" log=yes
# add action=drop chain=forward src-address-list="MC country" log=yes
