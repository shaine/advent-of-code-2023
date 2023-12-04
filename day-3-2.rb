#!/usr/bin/ruby

def run(file_handle)
  id_groups = []
  symbol_locations = []
  ratios = []

  file_handle.each_line do |line|
    symbol_locations << symbol_locations(line.strip)
    id_groups << id_group(line.strip)
  end

  id_groups.each.with_index do |row_ids, row_num|
    if row_num == 0
      syms_up = []
    else
      syms_up = symbol_locations[row_num - 1]
    end
    syms_on = symbol_locations[row_num]
    syms_down = symbol_locations[row_num + 1] || []

    row_ids.each do |group|
      record_symbol_adjancencies(
        syms_up,
        syms_on,
        syms_down,
        group[:location],
        group[:id]
      )
    end
  end

  symbol_locations.each do |symbol_row|
    symbol_row.each do |sym|
      ids = sym[:ids]
      if ids.size == 2
        ratios << ids.first.to_i * ids.last.to_i
      end
    end
  end

  sum_arr(ratios)
end

def symbol_locations(line)
  line
    .split('')
    .each
    .with_index
    .reduce([]) do |accum, (char, index)|
      accum << {location: index, ids: []} if char == "*"
      accum
    end
end

def id_group(line)
  line
    .split('')
    .each
    .with_index
    .reduce({ids: [], in_num: false}) do |accum, (char, index)|
      if char.match(/\d/)
        if accum[:in_num]
          accum[:ids].last[:id] << char
        else
          accum[:ids] << {id: char, location: index}
        end
        accum[:in_num] = true
      else
        accum[:in_num] = false
      end

      accum
    end
    .fetch(:ids)
end

def record_symbol_adjancencies(syms_up, syms_on, syms_down, index, id)
  record_row_adjacencies?(syms_up, index, id)
  record_row_adjacencies?(syms_on, index, id)
  record_row_adjacencies?(syms_down, index, id)
end

def record_row_adjacencies?(symbol_locations, index, id)
  symbol_locations.each { |sym| record_adjacency(sym, index, id) }
end

def record_adjacency(sym, start, id)
  if (start - 1..start + id.size).include?(sym[:location])
    sym[:ids] << id
  end
end

def sum_arr(arr)
  arr.compact.reduce(&:+)
end

# If this is run on its own rather than included by the unit tests
if __FILE__ == $0
  puts run(File.open("day-3-input.txt"))
end
