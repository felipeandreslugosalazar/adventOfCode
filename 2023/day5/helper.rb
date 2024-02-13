require_relative "vars"

def initialize_list
  puts "initialize list => start!".upcase.green
  @list = {}
  (0..99).to_a.each do |seed|
    @list[seed] = {
      soil: 0,
      fertilizer: 0,
      water: 0,
      light: 0,
      temperature: 0,
      humidity: 0,
      location: 0,
    }
  end

  print "@list[13] = "
  p @list[13]
  print "@list[14] = "
  p @list[14]
  print "@list[55] = "
  p @list[55]
  print "@list[79] = "
  p @list[79]
  puts "initialize list => done!".upcase.green
  puts "--------------------------------------".yellow
  @list
end

def seed_to_soil_map
  @dsr_set = []
  almanac[:seed_to_soil_map].map! do |dsr_set|
    @dsr_set << dsr_set
    #separate string to string elements
      .split
    # convert string elements to numbers
      .map! { |number| number.to_i }
    # puts @dsr_set.to_s.red
  end

  @done = []
  @dsr_set.each do |d, s, rl|
    # print "d : " # range destination
    # p d # range destination
    # print "s : " # range source
    # p s # range source
    # print "rl : " # range length
    # p rl # range length

    # puts
    # p
    se = s + rl - 1
    # p
    de = d + rl - 1

    # puts
    # p (s..se).to_a
    # p (d..de).to_a

    # p (s..se).to_a.zip(d..de).to_a

    (s..se).to_a.zip(d..de).to_a
      .each do |seed, soil|
      @list[seed][:soil] = soil
      @done << seed
    end
  end

  # we can have a list fomr 0 to 99 and mark the ones that have been mapped already
  # the ones missing we just copy from too

  (0..99).to_a.each do |num| # we create
    if !@done.include?(num)
      @list[num][:soil] = num
    end
  end

  puts "seed_to_soil_map => done!".upcase.green
  print "@list[13] = "
  p @list[13]
  print "@list[14] = "
  p @list[14]
  print "@list[55] = "
  p @list[55]
  print "@list[79] = "
  p @list[79]
  # pp @list
  puts "--------------------------------------".yellow
  @list
end

def soil_to_fertilizer_map
  puts "soil_to_fertilizer_map = START!".upcase.green
  @dsr_set = []
  almanac[:soil_to_fertilizer_map].map! do |dsr_set|
    @dsr_set << dsr_set
      .split
      .map! { |number| number.to_i }
  end

  @done = []
  @dsr_set.each do |d, s, rl|
    se = s + rl - 1
    de = d + rl - 1

    # puts "---------------------------------------------- ".yellow
    # pp (s..se).to_a.zip(d..de).to_a
    (s..se).to_a.zip(d..de).to_a
      .each do |soil, fertilizer|
      # print "soil = ".yellow
      # p soil

      # print "hash = ".yellow
      # p @list.select { |key, value| value[:soil] == soil }

      # print "seed = ".yellow
      @seed = @list.select { |key, value| value[:soil] == soil }.keys.join.to_i

      # print "BEFORE= ".yellow
      # p @list[@seed]

      # print "fertilizer = ".yellow
      # p fertilizer

      @list[@seed][:fertilizer] = fertilizer

      # print "NEW= ".yellow
      # p @list[@seed]

      @done << @seed
      # puts "---------------------------------------------- ".yellow
    end
    # pp @list
  end
  # print "@done.sort = ".green
  # p @done.sort

  (0..99).to_a.each do |num|
    if !@done.include?(num)
      @list[num][:fertilizer] = @list[num][:soil]
    end
  end

  print "@list[13] = "
  p @list[13]
  print "@list[14] = "
  p @list[14]
  print "@list[55] = "
  p @list[55]
  print "@list[79] = "
  p @list[79]
  # pp @list
  puts "soil_to_fertilizer_map => done!".upcase.green
  puts "--------------------------------------".yellow
  @list
end

def fertilizer_to_water_map
  puts "fertilizer_to_water_map = START!".upcase.green
  @dsr_set = []
  almanac[:fertilizer_to_water_map].map! do |dsr_set|
    @dsr_set << dsr_set
      .split
      .map! { |number| number.to_i }
  end

  @done = []
  @dsr_set.each do |d, s, rl|
    se = s + rl - 1
    de = d + rl - 1

    (s..se).to_a.zip(d..de).to_a
      .each do |fertilizer, water|
      @seed = @list.select { |key, value| value[:fertilizer] == fertilizer }.keys.join.to_i

      @list[@seed][:water] = water

      @done << @seed
    end
  end

  (0..99).to_a.each do |num|
    if !@done.include?(num)
      @list[num][:water] = @list[num][:fertilizer]
    end
  end

  print "@list[13] = "
  p @list[13]
  print "@list[14] = "
  p @list[14]
  print "@list[55] = "
  p @list[55]
  print "@list[79] = "
  p @list[79]
  # pp @list
  puts "fertilizer_to_water_map => done!".upcase.green
  puts "--------------------------------------".yellow
  @list
end

def water_to_light_map
  puts "water_to_light_map = START!".upcase.green
  @dsr_set = []
  almanac[:water_to_light_map].map! do |dsr_set|
    @dsr_set << dsr_set
      .split
      .map! { |number| number.to_i }
  end

  @done = []
  @dsr_set.each do |d, s, rl|
    se = s + rl - 1
    de = d + rl - 1

    (s..se).to_a.zip(d..de).to_a
      .each do |water, light|
      @seed = @list.select { |key, value| value[:water] == water }.keys.join.to_i

      @list[@seed][:light] = light

      @done << @seed
    end
  end

  (0..99).to_a.each do |num|
    if !@done.include?(num)
      @list[num][:light] = @list[num][:water]
    end
  end

  print "@list[13] = "
  p @list[13]
  print "@list[14] = "
  p @list[14]
  print "@list[55] = "
  p @list[55]
  print "@list[79] = "
  p @list[79]
  # pp @list
  puts "water_to_light_map => done!".upcase.green
  puts "--------------------------------------".yellow
  @list
end

def light_to_temperature_map
  puts "light_to_temperature_map = START!".upcase.green
  @dsr_set = []
  almanac[:light_to_temperature_map].map! do |dsr_set|
    @dsr_set << dsr_set
      .split
      .map! { |number| number.to_i }
  end

  @done = []
  @dsr_set.each do |d, s, rl|
    se = s + rl - 1
    de = d + rl - 1

    (s..se).to_a.zip(d..de).to_a
      .each do |light, temperature|
      @seed = @list.select { |key, value| value[:light] == light }.keys.join.to_i

      @list[@seed][:temperature] = temperature

      @done << @seed
    end
  end

  (0..99).to_a.each do |num|
    if !@done.include?(num)
      @list[num][:temperature] = @list[num][:light]
    end
  end

  print "@list[13] = "
  p @list[13]
  print "@list[14] = "
  p @list[14]
  print "@list[55] = "
  p @list[55]
  print "@list[79] = "
  p @list[79]
  # pp @list
  puts "light_to_temperature_map => done!".upcase.green
  puts "--------------------------------------".yellow
  @list
end

def temperature_to_humidity_map
  puts "temperature_to_humidity_map = START!".upcase.green
  @dsr_set = []
  almanac[:temperature_to_humidity_map].map! do |dsr_set|
    @dsr_set << dsr_set
      .split
      .map! { |number| number.to_i }
  end

  @done = []
  @dsr_set.each do |d, s, rl|
    se = s + rl - 1
    de = d + rl - 1

    (s..se).to_a.zip(d..de).to_a
      .each do |temperature, humidity|
      @seed = @list.select { |key, value| value[:temperature] == temperature }.keys.join.to_i

      @list[@seed][:humidity] = humidity

      @done << @seed
    end
  end

  (0..99).to_a.each do |num|
    if !@done.include?(num)
      @list[num][:humidity] = @list[num][:temperature]
    end
  end

  print "@list[13] = "
  p @list[13]
  print "@list[14] = "
  p @list[14]
  print "@list[55] = "
  p @list[55]
  print "@list[79] = "
  p @list[79]
  # pp @list
  puts "temperature_to_humidity_map => done!".upcase.green
  puts "--------------------------------------".yellow
  @list
end

def humidity_to_location_map
  puts "humidity_to_location_map = START!".upcase.green
  @dsr_set = []
  almanac[:humidity_to_location_map].map! do |dsr_set|
    @dsr_set << dsr_set
      .split
      .map! { |number| number.to_i }
  end

  @done = []
  @dsr_set.each do |d, s, rl|
    se = s + rl - 1
    de = d + rl - 1

    (s..se).to_a.zip(d..de).to_a
      .each do |humidity, location|
      @seed = @list.select { |key, value| value[:humidity] == humidity }.keys.join.to_i

      @list[@seed][:location] = location

      @done << @seed
    end
  end

  (0..99).to_a.each do |num|
    if !@done.include?(num)
      @list[num][:location] = @list[num][:humidity]
    end
  end

  print "@list[13] = "
  p @list[13]
  print "@list[14] = "
  p @list[14]
  print "@list[55] = "
  p @list[55]
  print "@list[79] = "
  p @list[79]
  # pp @list
  puts "humidity_to_location_map => done!".upcase.green
  puts "--------------------------------------".yellow
  @list
end
