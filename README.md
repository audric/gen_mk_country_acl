
# Generate Mikoritk RouterOS script to add country ip blocks address lists

$ gen_mk_country_acl.rb

## Things to keep in mind
- acting on ip supposely from a country maybe stupid
- nic can contain ip blocks from countries that do not belong to the nic anymore

## Sources:
- arin	ftp://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest
- afrinic	ftp://ftp.afrinic.net/pub/stats/afrinic/delegated-afrinic-latest
- apnic	ftp://ftp.apnic.net/pub/stats/apnic/delegated-apnic-latest
- lacnic	ftp://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-latest
- ripencc	ftp://ftp.ripe.net/ripe/stats/delegated-ripencc-latest

## To do
- flatten adjoining CIDR blocks where possible
- maybe think some sort of postprocessor for (iptables, cisco...)
