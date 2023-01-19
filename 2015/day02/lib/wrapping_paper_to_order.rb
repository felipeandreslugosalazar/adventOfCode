require_relative "input"

# PART 1.

# How many total square feet of wrapping paper should they order?

# imput array
def wrapping_paper_to_order_individual(input)
  input = input.class == String ? input.gsub("x", " ").split(" ").map { |d| d.to_i } : input

  l = input[0].to_i
  w = input[1].to_i
  h = input[2].to_i

  box_surface_area = (2 * l * w) + (2 * w * h) + (2 * h * l)

  input.sort!
  extra_paper = input[0] * input[1]
  extra_paper = input[0].to_i * input[1].to_i
  box_surface_area + extra_paper
end

# p wrapping_paper_to_order_individual([2, 3, 4])
# p wrapping_paper_to_order_individual([1, 1, 10])

# input string
def total_wrapping_paper_to_order(input)
  input
    .gsub("x", " ")
    .split(" ")
    .map! { |e| e.to_i }
    .each_slice(3).map { |e| e }
    .map { |e| wrapping_paper_to_order_individual(e) }
    .sum
end

puts "How many total square feet of wrapping paper should they order? " + total_wrapping_paper_to_order(@list_gifts_dimensions).to_s
