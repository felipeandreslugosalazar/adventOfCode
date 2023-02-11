class Grid
  require "colorize"

  def initialize(rows, cols)
    @xMax = rows
    @yMax = cols
    @grid_hash = {}

    for x in (0..@xMax).to_a
      for y in (0..@yMax).to_a
        @grid_hash["(#{x},#{y})"] = turned_off
      end
    end
    # print_indexes
    # print_status
    @grid_hash
  end

  # def print_indexes
  #   details_indexes
  #   for x in (0..@xMax).to_a
  #     puts
  #     for y in (0..@yMax).to_a
  #       print ("(#{x},#{y})")
  #     end
  #   end
  #   puts
  #   puts
  # end

  # def print_status
  #   details_status
  #   for x in (0..@xMax).to_a
  #     puts
  #     for y in (0..@yMax).to_a
  #       print " " + @grid_hash["(#{x},#{y})"]
  #     end
  #   end
  #   puts
  #   puts
  # end

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
        print @grid_hash["(#{x},#{y})"]
      end
    end
    puts
    puts
  end

  def turn_on_piece_of_grid(x1, y1, x2, y2)
    for x in (x1..x2).to_a
      # puts
      for y in (y1..y2).to_a
        @grid_hash["(#{x},#{y})"] = turned_on
      end
    end
    # print_status
  end

  def turn_off_piece_of_grid(x1, y1, x2, y2)
    for x in (x1..x2).to_a
      # puts
      for y in (y1..y2).to_a
        @grid_hash["(#{x},#{y})"] = turned_off
      end
    end
    # print_status
  end

  def toggle_piece_of_grid(x1, y1, x2, y2)
    for x in (x1..x2).to_a
      # puts
      for y in (y1..y2).to_a
        if @grid_hash["(#{x},#{y})"] == turned_off
          @grid_hash["(#{x},#{y})"] = turned_on
        else
          @grid_hash["(#{x},#{y})"] = turned_off
        end
      end
    end
    # print_status
  end

  def number_of_lights_on
    @lights_on_count = @grid_hash.select { |k, v| v == turned_on }.count
    @lights_on_count
  end

  def lights_secuence(instruction)
    @action = instruction[0]
    @x1 = instruction[1]
    @y1 = instruction[2]
    @x2 = instruction[3]
    @y2 = instruction[4]

    case @action
    when 0
      turn_off_piece_of_grid(@x1, @y1, @x2, @y2)
    when 1
      turn_on_piece_of_grid(@x1, @y1, @x2, @y2)
    else
      toggle_piece_of_grid(@x1, @y1, @x2, @y2)
    end
    @grid_hash
  end

  private

  def turned_off
    "."
  end

  def turned_on
    "O"
  end

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

  #   @grid_hash["(#{x},#{y})"] = turned_on
  #   # print_status
  # end

  # def turn_off_single_coordinate(x, y)
  #   @x = x
  #   @y = y

  #   @grid_hash["(#{x},#{y})"] = turned_off
  #   # print_status
  # end

  # def toggle_single_coordinate(x, y)
  #   @x = x
  #   @y = y

  #   if @grid_hash["(#{x},#{y})"] = turned_off
  #     @grid_hash["(#{x},#{y})"] = turned_on
  #   else
  #   end
  #   # print_status
  # end
end

# @grid_5x5 = Grid.new(5, 5)
# # # @grid_5x5.piece_of_grid(0, 0, 2, 2)
# @grid_5x5.turn_on_piece_of_grid(1, 1, 2, 2)
# @grid_5x5.print_status

# @grid_5x5.turn_off_piece_of_grid(2, 2, 2, 2)
# @grid_5x5.print_status

# @grid_5x5.piece_of_grid(0, 0, 2, 2)
# @grid_5x5.toggle_piece_of_grid(0, 0, 2, 2)
# @grid_5x5.print_status

# @grid_5x5.piece_of_grid(1, 1, 3, 3)
# @grid_5x5.print_status

# @grid.number_of_lights_on

def percentage_completed(array, iteration)
  @percentage = (100.to_f / (array.length.to_f)).round(2)
  print "\e[2J\e[f"
  print "\r#{@percentage * iteration}" + "% completed"
  # sleep(0.5)
  print "\e[2J\e[f" if iteration + 1 >= array.length
  print "\r100% completed" if iteration + 1 >= array.length
  puts
end
