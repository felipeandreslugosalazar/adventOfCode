require_relative "input"

# PART 2.

# How many total feet of ribbon should they order?

# input array
def total_feet_of_ribbon_per_present(input)
  input = input.class == String ? input.gsub("x", " ").split(" ").map { |d| d.to_i } : input

  input.sort!
  ribbon_smallest_perimeter = (input[0] + input[1]) * 2
  bow = (input[0] * input[1] * input[2])

  ribbon_smallest_perimeter + bow
end

# input string
def total_feet_of_ribbon_to_order(input)
  input
    .gsub("x", " ")
    .split(" ")
    .map! { |e| e.to_i }
    .each_slice(3).map { |e| e }
    .map { |e| total_feet_of_ribbon_per_present(e) }
    .sum
end

puts "How many total feet of ribbon should they order? " + total_feet_of_ribbon_to_order(@list_gifts_dimensions).to_s
