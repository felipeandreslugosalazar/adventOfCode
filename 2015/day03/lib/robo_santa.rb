require_relative "input"

# PART 2.

# how many houses receive at least one present?
# HERE THE SAME PROBLEM
# EVERY HOUSE THEY STOP AT GET A PRESENT
# BUT NOW WE HAVE 2 DELIVERS SANTA AND ROBO
# THEY START AT THE SAME LOCATION THEN THEY TAKE TURNS

# input array of strings
def houses_with_at_least_one_present_with_help(input)
  input = input.class == Array ? input : input.split("")

  # houses are in a 2d grid
  # so ...
  # house_number = (x,y)
  x = 0
  y = 0
  # santa starts at (0,0) and leaves a present
  # eveytime santa moves delivers a present
  travel_log = {}
  travel_log["#{x},#{y}"] = 1

  # santa moves one house at a time
  #like this always exactly one house to the north (^), south (v), east (>), or west (<).
  input.each_with_index do |instruction, i|
    case instruction
    when "^"
      y += 1
    when "v"
      y -= 1
    when ">"
      x += 1
    else
      x -= 1
    end

    if !travel_log["#{x},#{y}"].nil?
      travel_log["#{x},#{y}"] += 1
    else
      travel_log["#{x},#{y}"] = 1
    end
  end
  travel_log
end

def houses_with_at_least_one_present_with_help_with_robo_santa(input)
  input = input.split("")

  even_route = input.select.with_index { |e, i| i.even? }
  odd_route = input.select.with_index { |e, i| i.odd? }
  
  houses_with_at_least_one_present_with_help(even_route).merge(houses_with_at_least_one_present_with_help(odd_route)).keys.count
end

puts "How many houses receive at least one present ? => " + houses_with_at_least_one_present_with_help_with_robo_santa(@elf_instructions).to_s
