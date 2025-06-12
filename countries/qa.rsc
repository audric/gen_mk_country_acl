# MikroTik RouterOS address list for QA
# Generated at: 2025-06-12 09:46:56 +0200
# Total CIDR blocks: 43

/ip firewall address-list
add list="QA country" address=5.180.36.0/22 comment="QA"
add list="QA country" address=31.11.48.0/21 comment="QA"
add list="QA country" address=37.186.32.0/19 comment="QA"
add list="QA country" address=37.208.128.0/17 comment="QA"
add list="QA country" address=37.210.0.0/15 comment="QA"
add list="QA country" address=45.87.224.0/22 comment="QA"
add list="QA country" address=78.100.0.0/15 comment="QA"
add list="QA country" address=80.76.160.0/20 comment="QA"
add list="QA country" address=81.29.160.0/20 comment="QA"
add list="QA country" address=82.148.96.0/19 comment="QA"
add list="QA country" address=86.36.0.0/15 comment="QA"
add list="QA country" address=86.62.192.0/18 comment="QA"
add list="QA country" address=89.211.0.0/16 comment="QA"
add list="QA country" address=91.228.176.0/24 comment="QA"
add list="QA country" address=92.42.103.0/24 comment="QA"
add list="QA country" address=94.125.224.0/21 comment="QA"
add list="QA country" address=103.14.208.0/22 comment="QA"
add list="QA country" address=103.17.0.0/22 comment="QA"
add list="QA country" address=103.23.124.0/22 comment="QA"
add list="QA country" address=103.199.88.0/22 comment="QA"
add list="QA country" address=103.225.72.0/22 comment="QA"
add list="QA country" address=176.202.0.0/15 comment="QA"
add list="QA country" address=178.23.16.0/21 comment="QA"
add list="QA country" address=178.152.0.0/15 comment="QA"
add list="QA country" address=185.1.159.0/24 comment="QA"
add list="QA country" address=185.2.244.0/22 comment="QA"
add list="QA country" address=185.25.12.0/22 comment="QA"
add list="QA country" address=185.37.96.0/22 comment="QA"
add list="QA country" address=185.37.108.0/22 comment="QA"
add list="QA country" address=185.96.224.0/22 comment="QA"
add list="QA country" address=185.104.56.0/22 comment="QA"
add list="QA country" address=185.107.76.0/22 comment="QA"
add list="QA country" address=185.154.168.0/22 comment="QA"
add list="QA country" address=185.239.92.0/22 comment="QA"
add list="QA country" address=185.247.88.0/22 comment="QA"
add list="QA country" address=194.6.255.0/24 comment="QA"
add list="QA country" address=194.42.47.64/26 comment="QA"
add list="QA country" address=194.50.77.0/24 comment="QA"
add list="QA country" address=194.93.123.0/26 comment="QA"
add list="QA country" address=212.70.96.0/19 comment="QA"
add list="QA country" address=212.77.192.0/19 comment="QA"
add list="QA country" address=213.130.96.0/19 comment="QA"
add list="QA country" address=213.178.136.0/22 comment="QA"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="QA country" comment="Allow QA traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="QA country" comment="Block QA traffic"
