# MikroTik RouterOS address list for MZ
# Generated at: 2025-06-12 09:46:55 +0200
# Total CIDR blocks: 52

/ip firewall address-list
add list="MZ country" address=41.76.0.0/21 comment="MZ"
add list="MZ country" address=41.76.144.0/21 comment="MZ"
add list="MZ country" address=41.77.32.0/21 comment="MZ"
add list="MZ country" address=41.77.128.0/21 comment="MZ"
add list="MZ country" address=41.79.244.0/22 comment="MZ"
add list="MZ country" address=41.94.0.0/16 comment="MZ"
add list="MZ country" address=41.138.224.0/20 comment="MZ"
add list="MZ country" address=41.191.72.0/22 comment="MZ"
add list="MZ country" address=41.220.32.0/20 comment="MZ"
add list="MZ country" address=41.220.160.0/20 comment="MZ"
add list="MZ country" address=41.220.192.0/20 comment="MZ"
add list="MZ country" address=41.221.64.0/20 comment="MZ"
add list="MZ country" address=41.223.124.0/22 comment="MZ"
add list="MZ country" address=41.223.152.0/22 comment="MZ"
add list="MZ country" address=102.36.146.0/24 comment="MZ"
add list="MZ country" address=102.67.188.0/22 comment="MZ"
add list="MZ country" address=102.176.248.0/23 comment="MZ"
add list="MZ country" address=102.207.76.0/22 comment="MZ"
add list="MZ country" address=102.207.156.0/22 comment="MZ"
add list="MZ country" address=102.207.223.0/24 comment="MZ"
add list="MZ country" address=102.208.16.0/22 comment="MZ"
add list="MZ country" address=102.209.248.0/22 comment="MZ"
add list="MZ country" address=102.210.72.0/22 comment="MZ"
add list="MZ country" address=102.211.108.0/22 comment="MZ"
add list="MZ country" address=102.222.88.0/22 comment="MZ"
add list="MZ country" address=105.235.216.0/21 comment="MZ"
add list="MZ country" address=160.19.190.0/23 comment="MZ"
add list="MZ country" address=160.119.112.0/21 comment="MZ"
add list="MZ country" address=160.119.156.0/22 comment="MZ"
add list="MZ country" address=165.90.64.0/19 comment="MZ"
add list="MZ country" address=169.239.104.0/22 comment="MZ"
add list="MZ country" address=169.255.132.0/22 comment="MZ"
add list="MZ country" address=195.140.248.0/22 comment="MZ"
add list="MZ country" address=196.3.96.0/21 comment="MZ"
add list="MZ country" address=196.10.148.0/24 comment="MZ"
add list="MZ country" address=196.11.135.0/24 comment="MZ"
add list="MZ country" address=196.13.101.0/24 comment="MZ"
add list="MZ country" address=196.22.48.0/20 comment="MZ"
add list="MZ country" address=196.28.224.0/20 comment="MZ"
add list="MZ country" address=196.40.112.0/20 comment="MZ"
add list="MZ country" address=196.43.234.0/24 comment="MZ"
add list="MZ country" address=196.43.241.0/24 comment="MZ"
add list="MZ country" address=196.46.0.0/20 comment="MZ"
add list="MZ country" address=196.49.34.0/24 comment="MZ"
add list="MZ country" address=196.50.128.0/18 comment="MZ"
add list="MZ country" address=196.223.33.0/24 comment="MZ"
add list="MZ country" address=197.158.0.0/18 comment="MZ"
add list="MZ country" address=197.218.0.0/15 comment="MZ"
add list="MZ country" address=197.231.216.0/22 comment="MZ"
add list="MZ country" address=197.235.0.0/16 comment="MZ"
add list="MZ country" address=197.242.160.0/20 comment="MZ"
add list="MZ country" address=197.249.0.0/16 comment="MZ"

# Usage examples:
#
# Allow and count:
# /ip firewall filter
# add action=accept chain=input src-address-list="MZ country" comment="Allow MZ traffic"
# 
# Block and count:
# /ip firewall filter
# add action=drop chain=input src-address-list="MZ country" comment="Block MZ traffic"
