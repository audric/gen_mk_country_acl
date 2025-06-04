# MikroTik RouterOS address list for BQ
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 12

/ip firewall address-list
add list="BQ country" address=138.185.208.0/22 comment="BQ"
add list="BQ country" address=143.0.32.0/22 comment="BQ"
add list="BQ country" address=161.0.80.0/20 comment="BQ"
add list="BQ country" address=186.159.96.0/20 comment="BQ"
add list="BQ country" address=190.4.64.0/20 comment="BQ"
add list="BQ country" address=190.97.112.0/21 comment="BQ"
add list="BQ country" address=190.107.248.0/21 comment="BQ"
add list="BQ country" address=190.123.16.0/22 comment="BQ"
add list="BQ country" address=193.17.35.0/24 comment="BQ"
add list="BQ country" address=200.6.144.0/21 comment="BQ"
add list="BQ country" address=200.71.248.0/21 comment="BQ"
add list="BQ country" address=200.107.84.0/22 comment="BQ"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="BQ country" log=yes
# add action=drop chain=forward src-address-list="BQ country" log=yes
