
# Generate Mikrotik RouterOS script to add country ip blocks address lists

## The main script

```sh
$ gen_mk_country_acl.rb
```

This is the ruby script that downloads the ipv4 lists from the sources (NICs).
For every source an Mikrotik .rsc file is created.
Transfer those .rsc files in your Mikrotik firewall and import them:

```sh
mk_fw> /import file-name=mk_arin.rsc
mk_fw> /import file-name=mk_afrinic.rsc
mk_fw> /import file-name=mk_apnic.rsc
mk_fw> /import file-name=mk_lacnic.rsc
mk_fw> /import file-name=mk_ripencc.rsc
```

From now on you can do whatever you want with it.

### Here some examples:

```sh
mk_fw> /ip firewall filter
mk_fw> add action=drop chain=input src-address-list="ZZ country" log=yes
mk_fw> add action=drop chain=forward src-address-list="ZZ country" log=yes
```

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
