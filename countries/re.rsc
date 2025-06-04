# MikroTik RouterOS address list for RE
# Generated at: 2025-06-04 16:20:48 +0200
# Total CIDR blocks: 23

/ip firewall address-list
add list="RE country" address=5.57.96.0/19 comment="RE"
add list="RE country" address=41.213.128.0/17 comment="RE"
add list="RE country" address=41.242.124.0/22 comment="RE"
add list="RE country" address=62.61.192.0/18 comment="RE"
add list="RE country" address=78.108.224.0/20 comment="RE"
add list="RE country" address=80.69.208.0/20 comment="RE"
add list="RE country" address=102.35.0.0/16 comment="RE"
add list="RE country" address=102.135.224.0/20 comment="RE"
add list="RE country" address=102.213.8.0/22 comment="RE"
add list="RE country" address=109.122.128.0/18 comment="RE"
add list="RE country" address=129.122.64.0/18 comment="RE"
add list="RE country" address=139.26.0.0/16 comment="RE"
add list="RE country" address=154.67.0.0/16 comment="RE"
add list="RE country" address=164.160.68.0/22 comment="RE"
add list="RE country" address=164.160.224.0/20 comment="RE"
add list="RE country" address=165.90.128.0/18 comment="RE"
add list="RE country" address=165.169.0.0/16 comment="RE"
add list="RE country" address=168.253.128.0/18 comment="RE"
add list="RE country" address=185.147.224.0/22 comment="RE"
add list="RE country" address=185.161.8.0/22 comment="RE"
add list="RE country" address=185.165.32.0/22 comment="RE"
add list="RE country" address=193.56.203.0/24 comment="RE"
add list="RE country" address=213.55.0.0/18 comment="RE"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="RE country" log=yes
# add action=drop chain=forward src-address-list="RE country" log=yes
