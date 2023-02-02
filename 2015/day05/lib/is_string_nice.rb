require_relative "input"
require_relative "helper"

# PART 1.

# input array of strings
def how_many_strings_are_nice(input)
  input.split("\n").map! { |string| is_string_nice?(string) ? 1 : 0 }.sum
end

# puts "*****************************************"
# puts "***          DAY 05 - PART 01         ***"
# puts "*****************************************"
# puts "*** How many strings are nice? => " + how_many_strings_are_nice(@nice_naughty_list).to_s + " ***"
# puts "*****************************************"

puts "How many strings are nice? => " + how_many_strings_are_nice(@nice_naughty_list).to_s
# => 238
