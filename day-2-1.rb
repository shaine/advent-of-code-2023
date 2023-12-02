#!/usr/bin/ruby

def run
  ids = []

  File.open("day-2-input.txt") do |file_handle|
    file_handle.each_line do |line|
      ids << passing_id(line)
    end
  end

  puts sum_arr(ids)
end

def passing_id(line)
  /\d+/.match(line)[0].to_i if line_meets_mins?(line)
end

def line_meets_mins?(line)
  red_counts = line.scan(/\d+ red/).flatten.map(&:to_i)
  green_counts = line.scan(/\d+ green/).flatten.map(&:to_i)
  blue_counts = line.scan(/\d+ blue/).flatten.map(&:to_i)

  red_counts.max <= 12 &&
    green_counts.max <= 13 &&
    blue_counts.max <= 14
end

def sum_arr(arr)
  arr.compact.reduce(&:+)
end

run()
