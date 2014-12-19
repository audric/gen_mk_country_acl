#!/usr/bin/env ruby

#
# Generate Mikrotik RouterOS country ip blocks Address lists
#
# to do: flatten adjoining CIDR blocks where possible
#

require 'open-uri'

SOURCES = {
    'arin'    => 'ftp://ftp.arin.net/pub/stats/arin/delegated-arin-extended-latest' ,
    'afrinic' => 'ftp://ftp.afrinic.net/pub/stats/afrinic/delegated-afrinic-latest' ,
    'apnic'   => 'ftp://ftp.apnic.net/pub/stats/apnic/delegated-apnic-latest'       ,
    'lacnic'  => 'ftp://ftp.lacnic.net/pub/stats/lacnic/delegated-lacnic-latest'    ,
    'ripencc' => 'ftp://ftp.ripe.net/ripe/stats/delegated-ripencc-latest'
}

CIDR = {
    '16777216' => '/8',     '8388608' => '/9',     '4194304' => '/10',
     '2097152' => '/11',    '1048576' => '/12',     '524288' => '/13',
      '262144' => '/14',     '131072' => '/15',      '65536' => '/16',
       '32768' => '/17',      '16384' => '/18',       '8192' => '/19',
        '4096' => '/20',       '2048' => '/21',       '1024' => '/22',
         '512' => '/23',        '256' => '/24',        '128' => '/25',
          '64' => '/26',         '32' => '/27',         '16' => '/28',
           '8' => '/29',          '4' => '/30',          '2' => '/31',
           '1' => '/32'
}

def process_source(source)
    source_uri = SOURCES[source]
#    puts " ... processing source #{source_uri}"
    File.open("mk_#{source}.rsc",'w') {|fo|
        fo.puts "###############################################"
        fo.puts "# Mikrotik RouterOS script file auto-generated"
        fo.puts "#   script: github.com/audric/gen_mk_country_acl"
        fo.puts "#   ip source: #{source_uri}"
        fo.puts "###############################################"
        fo.puts "/ip firewall address-list"
        open(source_uri) {|fi|
            fi.each_line {|line|
                if !line.start_with?("#", "*", " ") then
                    (source, country, rectype, ip, num, update, dummy ) = line.split("|")
                    if rectype == 'ipv4' and country != '*' then
                        cidr = CIDR[num]
                        fo.puts "add address=#{ip}#{cidr} list=\"#{country} country\" comment=\"source #{source} #{update}\""
                    end
                end
            }
        }
    }
end

def process_all
    SOURCES.each do |source_name,source_uri|
#        puts " ... about to process source #{source_name} with uri #{source_uri}"
        process_source(source_name)
    end
end

#process_source('ripencc')
process_all

exit
