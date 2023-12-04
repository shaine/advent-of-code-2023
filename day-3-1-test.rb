#!/usr/bin/ruby

require './day-3-1.rb'

puts "\n\n\n\n\n"

puts "\nsymbol_locations"
puts symbol_locations("..123.").to_s + " == []"
puts symbol_locations("1&..2)3").to_s + " == [1, 5]"

puts "\nis_symbol"
puts symbol?(".").to_s + " == false"
puts symbol?("2").to_s + " == false"
puts symbol?("a").to_s + " == true"

puts "\nid_group"
puts id_group("...12..$$$25").to_s + " == [{id: 12, location: 3}, {id: 25, location: 10}]"

puts "\nadjacent_symbol? above"
puts adjacent_symbol?([0], [], [], 0, 1).to_s + " == true"
puts adjacent_symbol?([1], [], [], 0, 1).to_s + " == true"
puts adjacent_symbol?([3], [], [], 0, 1).to_s + " == false"
puts adjacent_symbol?([7], [], [], 8, 3).to_s + " == true"
puts adjacent_symbol?([1, 11], [], [], 8, 3).to_s + " == true"
puts adjacent_symbol?([1, 12], [], [], 8, 3).to_s + " == false"

puts "\nadjacent_symbol? on"
puts adjacent_symbol?([], [], [], 0, 1).to_s + " == false"
puts adjacent_symbol?([], [3], [], 5, 1).to_s + " == false"
puts adjacent_symbol?([], [4], [], 5, 1).to_s + " == true"
puts adjacent_symbol?([], [6], [], 5, 2).to_s + " == true"
puts adjacent_symbol?([], [7], [], 5, 2).to_s + " == true"
puts adjacent_symbol?([], [8], [], 5, 2).to_s + " == false"

puts "\nadjacent_symbol? below"
puts adjacent_symbol?([], [], [0], 0, 1).to_s + " == true"
puts adjacent_symbol?([], [], [1], 0, 1).to_s + " == true"
puts adjacent_symbol?([], [], [3], 0, 1).to_s + " == false"
puts adjacent_symbol?([], [], [7], 8, 3).to_s + " == true"
puts adjacent_symbol?([], [], [1, 11], 8, 3).to_s + " == true"
puts adjacent_symbol?([], [], [1, 12], 8, 3).to_s + " == false"
puts adjacent_symbol?([], [], [3], 0, 3).to_s + " == true"

puts "\nadjacent?"
puts adjacent?(3, 5, 5).to_s + " == false"
puts adjacent?(4, 5, 5).to_s + " == true"
puts adjacent?(5, 5, 5).to_s + " == true"
puts adjacent?(10, 5, 5).to_s + " == true"
puts adjacent?(11, 5, 5).to_s + " == false"
puts adjacent?(12, 5, 5).to_s + " == false"

puts "\nrun"
puts run(File.open("day-3-example.txt")).to_s + " == 4361"
