#!/usr/bin/env ruby
# Combine two MikroTik country .rsc files into one

require 'fileutils'

def usage
  puts "Usage: ruby combine_country.rb <country1> <country2>"
  exit 1
end

country1, country2 = ARGV
usage unless country1 && country2

dir = 'countries'
file1 = File.join(dir, "#{country1.downcase}.rsc")
file2 = File.join(dir, "#{country2.downcase}.rsc")
output_file = File.join(dir, "#{country1.downcase}_#{country2.downcase}.rsc")
address_list_name = "#{country1.upcase}+#{country2.upcase} country"

unless File.exist?(file1) && File.exist?(file2)
  puts "Error: One or both .rsc files not found in #{dir}/"
  exit 2
end

cidrs = []

[file1, file2].zip([country1.upcase, country2.upcase]).each do |file, orig_country|
  File.foreach(file) do |line|
    if line =~ /^add list=.*address=([0-9\.\/]+)/
      cidrs << { cidr: $1, country: orig_country }
    end
  end
end

File.open(output_file, 'w') do |f|
  f.puts "# MikroTik RouterOS address list for #{country1.upcase}+#{country2.upcase}"
  f.puts "# Combined from: #{country1.downcase}.rsc, #{country2.downcase}.rsc"
  f.puts "# Generated at: #{Time.now}"
  f.puts "# Total CIDR blocks: #{cidrs.length}"
  f.puts
  f.puts "/ip firewall address-list"
  cidrs.each do |entry|
    f.puts "add list=\"#{address_list_name}\" address=#{entry[:cidr]} comment=\"#{address_list_name} (#{entry[:country]})\""
  end
  f.puts
  f.puts "# Usage examples:"
  f.puts "# /ip firewall filter"
  f.puts "# add action=accept chain=input src-address-list=\"#{address_list_name}\" comment=\"Allow #{address_list_name} traffic\""
  f.puts "# add action=drop chain=input src-address-list=\"#{address_list_name}\" comment=\"Block #{address_list_name} traffic\""
end

puts "Combined file written to: #{output_file}"