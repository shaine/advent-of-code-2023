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
  if /\d/.match(line)
    "#{first_digit(line)}#{last_digit(line)}".to_i
  else
    0
  end
end

def first_digit(str)
  /\d/.match(str)[0]
end

def last_digit(str)
  /.*(\d)/.match(str)[1]
end

run()
