# MikroTik RouterOS address list for GG
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 23

/ip firewall address-list
add list="GG country" address=45.11.144.0/22 comment="GG"
add list="GG country" address=45.135.252.0/22 comment="GG"
add list="GG country" address=46.31.240.0/21 comment="GG"
add list="GG country" address=46.235.128.0/21 comment="GG"
add list="GG country" address=78.41.0.0/21 comment="GG"
add list="GG country" address=92.43.208.0/21 comment="GG"
add list="GG country" address=93.187.0.0/21 comment="GG"
add list="GG country" address=93.189.160.0/21 comment="GG"
add list="GG country" address=94.247.84.0/23 comment="GG"
add list="GG country" address=185.31.220.0/22 comment="GG"
add list="GG country" address=185.37.76.0/22 comment="GG"
add list="GG country" address=185.85.253.0/24 comment="GG"
add list="GG country" address=185.104.200.0/22 comment="GG"
add list="GG country" address=185.110.36.0/22 comment="GG"
add list="GG country" address=185.143.248.0/22 comment="GG"
add list="GG country" address=185.159.16.0/22 comment="GG"
add list="GG country" address=185.201.0.0/22 comment="GG"
add list="GG country" address=193.104.140.0/24 comment="GG"
add list="GG country" address=193.169.206.0/23 comment="GG"
add list="GG country" address=194.9.2.0/23 comment="GG"
add list="GG country" address=194.116.244.0/23 comment="GG"
add list="GG country" address=194.145.126.0/24 comment="GG"
add list="GG country" address=195.226.128.0/19 comment="GG"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="GG country" log=yes
# add action=drop chain=forward src-address-list="GG country" log=yes
