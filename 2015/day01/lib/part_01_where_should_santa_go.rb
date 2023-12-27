require_relative "input"

# PART 1.

# To what floor do the instructions take Santa?

def where_should_santa_go(input)
  @time_start = Time.now
  input = input.split("")
  # # start at ground floor
  sum = 0
  input.each do |instruction|
    #   # An opening parenthesis, (, means he should go up one floor => +1
    #   # a closing parenthesis, ), means he should go down one floor. => -1
    direction = (instruction == "(" ? 1 : -1)
    sum = sum + direction
  end
  @time_end = Time.now
  puts "total time = #{@time_end - @time_start}"
  sum
end

def where_should_santa_go_27_12_20023(input)
  @time_start = Time.now
  input1 = @instructions.chars.select { |e| e == "(" }.count
  input2 = @instructions.chars.select { |e| e == ")" }.count
  @answer = input1 > input2 ? input1 - input2 : input1 + input2
  @time_end = Time.now
  puts "total time = #{@time_end - @time_start}"
  return @answer
end

# =>
puts "To what floor do the instructions take Santa? " + where_should_santa_go(@instructions).to_s
# =>
puts "To what floor do the instructions take Santa? " + where_should_santa_go_27_12_20023(@instructions).to_s
