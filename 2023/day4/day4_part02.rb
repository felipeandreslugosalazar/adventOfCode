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
    .each.with_index do
    |line, index| # here we traverse the big array
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

  puts "# => [card number, number of instances] # 1".green
  card_and_num_of_winnings.each do |card_num, wins|
    if !final_count.has_key?(card_num)
      # if final count doesnt have the card_num already
      # add the original scratchcard to the count
      final_count[card_num] = 1
      #  now lets process the winnins
      # wins = 4
      # if !wins.zero?
      #   puts "[#{card_num},#{wins}]"
      #   p ((card_num + 1)..(card_num + wins))
      #   ((card_num + 1)..(card_num + wins)).to_a.each do |scratchcard_copy|
      #     puts "scratchcard_copy".red
      #     p scratchcard_copy
      #     p final_count[scratchcard_copy]
      #   end
      #   # raise
      # end
    end
  end
  # pp final_count

  # puts "# => [card number, number of instances] # 2".green
  # puts "------------------------------------  ".yellow
  #  now lets process the winnins
  card_and_num_of_winnings.each do |card_num, wins|
    # AHORA PROCESAMOS LOS WINS
    # ya tenemos los conteos iniciales de las tarjetas, todas en 1
    # si el win no es 0 hacemos lo siguiente
    # leemos el numero de la tarjeta
    if !wins.zero?
      # print "card_num = "
      # p card_num
      # leemos el numero de tarjetas de ese numero
      # print "final_count[#{card_num}] = "
      # p final_count[card_num]
      # leemos el numero de wins
      # print "wins = "
      # p wins
      # tenemos una arreglo de tarjetas
      # print "arreglo = "
      @array_wins = ((card_num + 1)..((card_num) + wins)).to_a
      # esas tarjetas carnum + 1 ganaran el numero de wins cada una

      @array_wins.each do |win|
        # puts "------------------------------------  ".magenta
        # p win
        # print "final_count[#{win}] = "
        # p final_count[win]
        final_count[win] += final_count[card_num]
        # puts "------------------------------------  ".magenta
      end
      # puts "------------------------------------  ".yellow
    end
  end
  # puts "------------------------------------  ".yellow

  pp final_count

  final_count_sum = 0
  final_count.each do |card_number, final_count|
    final_count_sum += final_count
  end
  p final_count_sum
end

day_4_part_2(test_input)
# day_4_part_2(INPUT)
