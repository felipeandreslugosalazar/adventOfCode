require_relative "vars"

def part_1(var)
  var
    .split("\n")
    .map! { |e| e.gsub(/\D/, "") }
    .map! { |e| ("#{e.chars.first}#{e.chars.last}") }
    .map! { |e| e.to_i }
    .sum
end

# ============================================================

WORD_LIST = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

WORD_DIC = {
  "one" => "1", "two" => "2", "three" => "3", "four" => "4", "five" => "5", "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9",
}

WORD_LIST_REVERSE = ["eno", "owt", "eerht", "ruof", "evif", "xis", "neves", "thgie", "enin", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

WORD_DIC_REVERSE = {
  "eno" => "1", "owt" => "2", "eerht" => "3", "ruof" => "4", "evif" => "5", "xis" => "6", "neves" => "7", "thgie" => "8", "enin" => "9",
}

WORD_REGEXP = Regexp.union(*WORD_LIST)
# => /one|two|three|four|five|six|seven|eight|nine|1|2|3|4|5|6|7|8|9/
WORD_REGEXP_REVERSE = Regexp.union(*WORD_LIST_REVERSE)

def part_2(var)
  first_digits = var
    .split("\n")
  # here we need an algorithm to find words in strings
    .map! { |line| line.scan(WORD_REGEXP) }
    .map! { |line| [line.first] }
  # .map! { |line| [line.first, line.last] }
    .each do |line|
    line.map! do |e|
      !e.to_i.zero? ? e : WORD_DIC[e]
    end
  end
    .map! { |e| e.join }
    .map! { |e| e.to_i }

  last_digits = var
    .split("\n")
  #   # here we need an algorithm to find words in strings
    .map! { |line| line.reverse }
    .map! { |line| line.scan(WORD_REGEXP_REVERSE) }
    .map! { |line| [line.first] }
    .flatten
    .map! { |e| !e.to_i.zero? ? e : WORD_DIC_REVERSE[e] }
    .map! { |e| e.to_i }

  first_digits.zip(last_digits).map! { |e| e.join.to_i }
    .sum
end

# pp part_1(INPUT)
# ==> 55538

pp part_2(INPUT)
# ==> 54875
