require_relative "input"

# PART 1.

# To what floor do the instructions take Santa?

def where_should_santa_go(input)
  input = input.split("")
  # # start at ground floor
  sum = 0
  input.each_with_index do |step, i|
    #   # An opening parenthesis, (, means he should go up one floor => +1
    #   # a closing parenthesis, ), means he should go down one floor. => -1
    direction = (step == "(" ? 1 : -1)
    sum = sum + direction
  end
  # puts "To what floor do the instructions take Santa? " + sum.to_s
  sum
end
