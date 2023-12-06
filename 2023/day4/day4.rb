require_relative "vars"

test_input = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"

def day_4_part_1(input)
  input
    .split("\n")
  # .first(10)
    .map! { |card| card.gsub(/Card.\d: /, "") }
    .map! { |card| card.split("|") }
    .map! do |winning, my_numbers|
    [winning.split, my_numbers.split]
  end
  # [["41", "48", "83", "86", "17"], ["83", "86", "6", "31", "17", "9", "48", "53"]],
    .map! do |winning, my_numbers|
    my_numbers.select! do |number|
      winning.include?(number)
    end
  end
  # [["83", "86", "17", "48"], ["61", "32"], ["21", "1"], ["84"], [], []]
    .map! do |elements|
    elements.length
  end
    .select! do |array_length|
    array_length > 0
  end
  #### [4, 2, 2, 1, 0, 0]
  #### [4, 2, 2, 1]
  # here we need to apply score
    .map! do |array_length|
    score = 0

    if array_length == 1
      score = 1
    elsif array_length >= 2
      score += 2 ** (array_length - 1)
    else
      score = 0
    end
  end
    .sum
end

# pp day_4_part_1(test_input)
pp day_4_part_1(INPUT)
