require_relative "input"

# PART 2.

# What is the position of the character that causes Santa to first enter the basement?

def position_of_the_character(input)
  input = input.split("")
  # # start at ground floor
  sum = 0
  position = 0
  input.each.with_index do |instruction, i|
    #   #   # An opening parenthesis, (, means he should go up one floor => +1
    #   #   # a closing parenthesis, ), means he should go down one floor. => -1
    sum = sum + (instruction == "(" ? 1 : -1)
    if sum == -1
      position = i + 1
      break
    end
  end
  position
end

# =>
puts "What is the position of the character that causes Santa to first enter the basement? " + position_of_the_character(@instructions).to_s
