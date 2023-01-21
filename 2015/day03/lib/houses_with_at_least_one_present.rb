require_relative "input"

# PART 1.

# PROBLEM : How many houses receive at least one present?
# every visited house recieve a present, so just need to find the way to tab the houses santa is visiting, puts the cordinates of each house  in a list and count with no repetition

# input array of strings
def houses_with_at_least_one_present(input)
  input = input.split("")

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
  input.each do |instruction|
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
  travel_log.uniq.count
end

puts "How many houses receive at least one present ? => " + houses_with_at_least_one_present(@elf_instructions).to_s
