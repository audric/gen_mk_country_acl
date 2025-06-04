# MikroTik RouterOS address list for AG
# Generated at: 2025-06-04 16:35:01 +0200
# Total CIDR blocks: 42

/ip firewall address-list
add list="AG country" address=23.132.144.0/24 comment="AG"
add list="AG country" address=23.176.240.0/24 comment="AG"
add list="AG country" address=46.19.184.0/21 comment="AG"
add list="AG country" address=69.50.64.0/20 comment="AG"
add list="AG country" address=69.57.224.0/19 comment="AG"
add list="AG country" address=76.76.160.0/19 comment="AG"
add list="AG country" address=77.239.224.0/19 comment="AG"
add list="AG country" address=91.108.0.0/18 comment="AG"
add list="AG country" address=91.212.88.0/24 comment="AG"
add list="AG country" address=92.62.48.0/20 comment="AG"
add list="AG country" address=94.124.176.0/21 comment="AG"
add list="AG country" address=94.229.96.0/20 comment="AG"
add list="AG country" address=95.140.80.0/20 comment="AG"
add list="AG country" address=95.161.0.0/17 comment="AG"
add list="AG country" address=95.161.128.0/21 comment="AG"
add list="AG country" address=95.161.136.0/22 comment="AG"
add list="AG country" address=95.161.240.0/20 comment="AG"
add list="AG country" address=109.239.128.0/20 comment="AG"
add list="AG country" address=149.112.100.0/24 comment="AG"
add list="AG country" address=149.154.160.0/20 comment="AG"
add list="AG country" address=162.210.156.0/22 comment="AG"
add list="AG country" address=162.222.84.0/22 comment="AG"
add list="AG country" address=162.252.188.0/22 comment="AG"
add list="AG country" address=170.39.108.0/22 comment="AG"
add list="AG country" address=178.18.224.0/20 comment="AG"
add list="AG country" address=185.51.60.0/22 comment="AG"
add list="AG country" address=185.182.12.0/22 comment="AG"
add list="AG country" address=188.65.64.0/21 comment="AG"
add list="AG country" address=192.64.120.0/22 comment="AG"
add list="AG country" address=199.16.56.0/22 comment="AG"
add list="AG country" address=199.48.204.0/22 comment="AG"
add list="AG country" address=199.189.112.0/22 comment="AG"
add list="AG country" address=204.16.112.0/22 comment="AG"
add list="AG country" address=205.217.224.0/19 comment="AG"
add list="AG country" address=206.83.13.0/24 comment="AG"
add list="AG country" address=206.214.0.0/19 comment="AG"
add list="AG country" address=208.83.80.0/21 comment="AG"
add list="AG country" address=209.59.64.0/18 comment="AG"
add list="AG country" address=212.232.64.0/20 comment="AG"
add list="AG country" address=213.21.0.0/19 comment="AG"
add list="AG country" address=213.21.48.0/20 comment="AG"
add list="AG country" address=216.48.96.0/22 comment="AG"

# Usage examples:
# /ip firewall filter
# add action=drop chain=input src-address-list="AG country" log=yes
# add action=drop chain=forward src-address-list="AG country" log=yes
