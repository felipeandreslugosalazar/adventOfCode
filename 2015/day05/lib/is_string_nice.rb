require "colorize"
require_relative "input"
require_relative "helper_01"
require_relative "helper_02"

# *************************
# ******** PART 1. ********
# *************************

# input array of strings
def how_many_strings_are_nice(input)
  input.split("\n").map! { |string| is_string_nice?(string) ? 1 : 0 }.sum
end

# puts "*****************************************"
# puts "***          DAY 05 - PART 01         ***"
# puts "*****************************************"
# puts "*** How many strings are nice? => " + how_many_strings_are_nice(@nice_naughty_list).to_s + " ***"
# puts "*****************************************"

# puts "How many strings are nice? => " + how_many_strings_are_nice(@nice_naughty_list).to_s
# => 238 == > YES! ==> *

# *************************
# ******** PART 2. ********
# *************************

# input array of strings
# def how_many_strings_are_nice_new_rulz(input)
#   input.split("\n").map! { |string| is_string_nice_new_rulz?(string) ? 1 : 0 }.sum
# end

def how_many_strings_are_nice_new_rulz(input)
  input.split("\n").map! { |string| is_string_nice_new_rulz?(string) ? 1 : 0 }.sum
end

# puts "How many strings are nice under the new rulz? => " + how_many_strings_are_nice_new_rulz(@nice_naughty_list).to_s
# => 66 ==> NO!
# => 69 ==> SI!
