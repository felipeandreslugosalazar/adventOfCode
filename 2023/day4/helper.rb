def print_input(input)
  puts "Raw input".upcase.green

  @input = input
end

def raw_data_to_array_of_numbers(input)
  puts "Processed input".upcase.green
  @input = input

  @input = @input
    .split("\n")
  # .first(10)
    .map! { |card| card.gsub(/Card.\d: /, "") }
    .map! { |card| card.split("|") }
    .map! { |winning, my_numbers| [winning.split, my_numbers.split] }
    .each do |winning, my_numbers|
    winning.map! { |n| n.to_i } && my_numbers.map! { |n| n.to_i }
  end
    .each do |winning, my_numbers|
    winning.sort!
    my_numbers.sort!
  end
  @input
end

def card_number_and_winnings(input)
  puts "# => [card number, number of winnings]".green
  @input = input

  @card_and_num_of_winnings = []

  @input
    .each.with_index do |line, index|
    # here we traverse the big array
    # puts "card = #{index + 1} --> #{line}".green

    # define vars for the array line
    @winning = line[0]
    # print "my numbers = ".yellow
    @my_numbers = line[1]
    # puts "vuelta = #{index + 1}"
    # create a hash for the index / matching numbers
    match = 0
    # p @card_and_num_of_winnings[index + 1] = { index + 1 => 0 }
    # @card_and_num_of_winnings << { index + 1 => 0 }
    @card_and_num_of_winnings[index] = [index + 1, match]

    @my_numbers.each do |my_num|
      if @winning.include?(my_num)
        # puts my_num.to_s.green + " matched !".green
        match += 1
        @card_and_num_of_winnings[index] = [index + 1, match]
      end
      # puts "up to this point alles ok"
      # puts "how do we count the boards ???"
    end
  end
  @card_and_num_of_winnings
end

def first_count(input)
  puts "# First count => [card number, number of instances] - original number of cards".green

  @input = input
  @count = {}

  @card_and_num_of_winnings.each do |card_num, wins|
    if !@count.has_key?(card_num)
      # add the original scratchcard to the count
      @count[card_num] = 1
    end
  end
  p @count
end

def final_count(input)
  puts "# Final count".green

  @input = input
  # puts "# => [card number, number of instances] # 2".green
  # puts "------------------------------------  ".yellow
  #  now lets process the winnins
  @input.each do |card_num, wins|

    # puts
    # AHORA PROCESAMOS LOS WINS
    # ya tenemos los conteos iniciales de las tarjetas, todas en 1
    # si el win no es 0 hacemos lo siguiente
    # leemos el numero de la tarjeta
    if !wins.zero?
      # print "card_num = "
      # p card_num
      # leemos el numero de tarjetas de ese numero
      # print "@count[#{card_num}] = "
      # p @count[card_num]
      # leemos el numero de wins
      # print "wins = "
      # p wins
      # tenemos una arreglo de tarjetas
      # print "arreglo = "
      @array_wins = ((card_num + 1)..((card_num) + wins)).to_a
      # esas tarjetas carnum + 1 ganaran el numero de wins cada una

      print "[#{card_num},#{wins}] ".green
      puts "@count[#{card_num}] = #{@count[card_num]}".magenta
      puts "add #{@count[card_num]} to #{@array_wins}".blue
      @array_wins.each do |win|
        # puts "------------------------------------  ".magenta
        # p win
        # print "@count[#{win}] = "
        # p @count[win]

        @count[win] = 1 if @count[win].nil?

        @count[win] += @count[card_num]
        # puts "------------------------------------  ".magenta
        # print "#{win} ".red
        # pp @count
      end
      puts @count.to_s.green
      puts "------------------------------------  ".yellow
    end
  end
  # puts "------------------------------------  ".yellow
  @count
end

def sum(input)
  puts "Sum - count".green
  @input = input

  # suma total de todas las tarjetas
  @final_count_sum = 0
  @input.each do |card_number, final_count|
    @final_count_sum += final_count
  end
  @final_count_sum
end
