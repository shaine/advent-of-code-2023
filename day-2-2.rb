#!/usr/bin/ruby

def run
  powers = []

  File.open("day-2-input.txt") do |file_handle|
    file_handle.each_line do |line|
      powers << game_power(line)
    end
  end

  puts sum_arr(powers)
end

def game_power(line)
  red_counts = line.scan(/\d+ red/).flatten.map(&:to_i)
  green_counts = line.scan(/\d+ green/).flatten.map(&:to_i)
  blue_counts = line.scan(/\d+ blue/).flatten.map(&:to_i)

  red_counts.max * green_counts.max * blue_counts.max
end

def sum_arr(arr)
  arr.compact.reduce(&:+)
end

run()
