require_relative "vars"
require "colorize"

test_input = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"

def day_4_part_2(input)
  @input = input
  pp input
  puts

  card_and_num_of_winnings = []

  @input = @input
    .split("\n")
  # .first(5)
    .map! { |card| card.gsub(/Card.\d: /, "") }
    .map! { |card| card.split("|") }
    .map! { |winning, my_numbers| [winning.split, my_numbers.split] }
    .each do |winning, my_numbers|
    winning.map! { |n| n.to_i } &&
      my_numbers.map! { |n| n.to_i }
  end
    .each.with_index do |line, index| # here we traverse the big array
    # puts "card = #{index + 1} --> #{line}".green

    # define vars for the array line
    @winning = line[0]
    # print "my numbers = ".yellow
    @my_numbers = line[1]
    # puts "vuelta = #{index + 1}"
    # create a hash for the index / matching numbers
    match = 0
    # p card_and_num_of_winnings[index + 1] = { index + 1 => 0 }
    # card_and_num_of_winnings << { index + 1 => 0 }
    card_and_num_of_winnings[index] = [index + 1, match]

    @my_numbers.each do |my_num|
      if @winning.include?(my_num)
        # puts my_num.to_s.green + " matched !".green
        match += 1
        card_and_num_of_winnings[index] = [index + 1, match]
      end
      # puts "up to this point alles ok"
      # puts "how do we count the boards ???"
    end
  end
  puts "# => [card number, number of winnings]".green
  pp card_and_num_of_winnings

  final_count = {}

  puts "# => [card number, number of instances]".green
  card_and_num_of_winnings.each do |car_num, wins|
    if !final_count.has_key?(car_num)
      # if final count doesnt have the car_num already
      # add the original scratchcard to the count
      final_count[car_num] = 1
      #  now lets process the winnins
      # wins = 4
      if !wins.zero?
        p (car_num + 1..car_num + wins).to_a.each do |copy|
          final_count[copy] += 1
        end
      end
    end
  end
  pp final_count
end

day_4_part_2(test_input)
# day_4_part_2(INPUT)
