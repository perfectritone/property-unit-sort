#!/usr/bin/env ruby

apartment_pattern = /^#?(\d+)(\w*).*/

filename = ARGV[0] or raise "You must specify a filename"
apartments = File.read(filename).split("\n")

sorted_apartments = apartments.sort_by do |apartment|
  match = apartment_pattern.match(apartment)
  [match[1].to_i, match[2]]
end

sorted_apartments.each { |apartment| puts apartment }
