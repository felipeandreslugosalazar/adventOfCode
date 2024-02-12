require_relative "vars"
require_relative "helper"
require "colorize"

test_input = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"

def day_4_part_2(input)
  @input = input

  # print input as reference
  pp print_input(@input)
  puts

  # process data to easy comparison
  pp raw_data_to_array_of_numbers(@input)
  puts

  # raise
  #process data to have [card number,number of winnings]
  p card_number_and_winnings(@input)
  puts

  p first_count(@card_and_num_of_winnings)
  puts

  p final_count(@card_and_num_of_winnings)
  puts

  p sum(@count)
  puts
end

day_4_part_2(test_input)
# day_4_part_2(INPUT)
