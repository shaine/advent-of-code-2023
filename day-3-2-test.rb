#!/usr/bin/ruby

require './day-3-2.rb'

puts "\n\n\n\n\n"

puts "\nsymbol_locations"
puts symbol_locations("..123.").to_s + " == []"
puts symbol_locations("1*..2)3").to_s + " == [1]"

puts "\nid_group"
puts id_group("...12..$$$25").to_s + " == [{id: 12, location: 3}, {id: 25, location: 10}]"

puts "\nrun"
puts run(File.open("day-3-example.txt")).to_s + " == 467835"
