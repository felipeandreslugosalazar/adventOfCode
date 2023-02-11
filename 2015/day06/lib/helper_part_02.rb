class Grid
  require "colorize"

  def initialize(rows, cols)
    @xMax = rows
    @yMax = cols
    @bright_hash = {}

    for x in (0..@xMax).to_a
      for y in (0..@yMax).to_a
        @bright_hash["(#{x},#{y})"] = 0
      end
    end
    # print_indexes
    # print_status
    @bright_hash
  end

  def print_indexes
    # details_indexes
    for x in (0..@xMax).to_a
      puts
      for y in (0..@yMax).to_a
        print ("(#{x},#{y})")
      end
    end
    puts
    puts
  end

  def print_status
    # details_status
    for x in (0..@xMax).to_a
      puts
      for y in (0..@yMax).to_a
        print "   " + @bright_hash["(#{x},#{y})"].to_s
      end
    end
    puts
    puts
  end

  def piece_of_grid(x1, y1, x2, y2)
    for x in (x1..x2).to_a
      puts
      for y in (y1..y2).to_a
        print ("(#{x},#{y})")
      end
    end
    puts
    for x in (x1..x2).to_a
      puts
      for y in (y1..y2).to_a
        print @bright_hash["(#{x},#{y})"]
      end
    end
    puts
    puts
  end

  def turn_on_piece_of_grid(x1, y1, x2, y2)
    for x in (x1..x2).to_a
      # puts
      for y in (y1..y2).to_a
        @bright_hash["(#{x},#{y})"] += 1
      end
    end
    # print_status
  end

  def turn_off_piece_of_grid(x1, y1, x2, y2)
    for x in (x1..x2).to_a
      # puts
      for y in (y1..y2).to_a
        @bright_hash["(#{x},#{y})"] -= 1
        @bright_hash["(#{x},#{y})"] = 0 if @bright_hash["(#{x},#{y})"] < 0
      end
    end
    # print_status
  end

  def toggle_piece_of_grid(x1, y1, x2, y2)
    for x in (x1..x2).to_a
      # puts
      for y in (y1..y2).to_a
        @bright_hash["(#{x},#{y})"] += 2
      end
    end
    # print_status
  end

  def number_of_lights_on
    @lights_on_count = @bright_hash.select { |k, v| v == turned_on }.count
    @lights_on_count
  end

  def brightness
    @brightness = @bright_hash.sum { |k, v| v }
  end

  def lights_secuence(instruction)
    @action = instruction[0]
    @x1 = instruction[1]
    @y1 = instruction[2]
    @x2 = instruction[3]
    @y2 = instruction[4]

    # piece_of_grid(@x1, @y1, @x2, @y2)

    case @action
    when 0
      turn_off_piece_of_grid(@x1, @y1, @x2, @y2)
    when 1
      turn_on_piece_of_grid(@x1, @y1, @x2, @y2)
    else
      toggle_piece_of_grid(@x1, @y1, @x2, @y2)
    end
    @bright_hash
  end

  private

  # def turned_off
  #   "."
  # end

  # def turned_on
  #   "O"
  # end

  def details_indexes
    puts "GRID #{@xMax}x#{@yMax} - indexes -".yellow
  end

  # def details_status
  #   puts "GRID #{@xMax}x#{@yMax} - status - ".yellow
  #   puts
  #   puts " #{turned_on} = turn on".yellow
  #   puts " #{turned_off} = turn off".yellow
  # end

  # def turn_on_single_coordinate(x, y)
  #   @x = x
  #   @y = y

  #   @bright_hash["(#{x},#{y})"] = turned_on
  #   # print_status
  # end

  # def turn_off_single_coordinate(x, y)
  #   @x = x
  #   @y = y

  #   @bright_hash["(#{x},#{y})"] = turned_off
  #   # print_status
  # end

  # def toggle_single_coordinate(x, y)
  #   @x = x
  #   @y = y

  #   if @bright_hash["(#{x},#{y})"] = turned_off
  #     @bright_hash["(#{x},#{y})"] = turned_on
  #   else
  #   end
  #   # print_status
  # end
end

def percentage_completed(array, iteration)
  @percentage = (100.to_f / (array.length.to_f)).round(2)
  print "\e[2J\e[f"
  print "\r#{@percentage * iteration}" + "% completed"
  # sleep(0.5)
  print "\e[2J\e[f" if iteration + 1 >= array.length
  print "\r100% completed" if iteration + 1 >= array.length
  puts
end
