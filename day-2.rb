#!/usr/bin/ruby

def run
  digits = []

  File.open("day-1-input.txt", "r") do |file_handle|
    file_handle.each_line do |line|
      digits << unfuck_number(line)
    end
  end

  puts digits.reduce(&:+)
end

def unfuck_number(line)
  "#{first_digit(line)}#{last_digit(line)}".to_i
end

def first_digit(str)
  match = /\d|one|two|three|four|five|six|seven|eight|nine/.match(str)[0]
  string_to_number(match)
end

def last_digit(str)
  match = /.*(\d|one|two|three|four|five|six|seven|eight|nine)/.match(str)[1]
  string_to_number(match)
end

def string_to_number(str)
  case str
  when "one" then 1
  when "two" then 2
  when "three" then 3
  when "four" then 4
  when "five" then 5
  when "six" then 6
  when "seven" then 7
  when "eight" then 8
  when "nine" then 9
  else str
  end
end

run()
