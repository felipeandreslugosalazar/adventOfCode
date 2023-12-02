require_relative "vars"

def part_1(var)
  var
    .split("\n")
    .map! { |e| e.gsub(/\D/, "") }
    .map! { |e| ("#{e.chars.first}#{e.chars.last}") }
    .map! { |e| e.to_i }
    .sum
end

def part_2(var)
  var
    .split("\n")
  # .map! { |e| e.gsub(/\D/, "") }
    .map! { |e| ("#{e.chars.first}#{e.chars.last}") }
    .map! { |e| e.to_i }
    .sum
end

pp part_1(INPUT)
# ==> 55538
# pp part_2(TEST_VAR)
