require "matrix"
require "colorize"
require_relative "vars"
# require_relative "test"

test_var_part_1 = "467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598.."

# la segunda linea es esta pero testiamos con 0
# ..30..633.

def neighbors(coordinate, grid_hash) # "0,0"
  # puts "inside neighbors !!!".upcase.green

  # remap coordinate from string to t.integer :

  coordinate # "0,0"
  coordinate = coordinate.split(",").map! { |e| e.to_i } # [0,0]

  x = coordinate[0] # put in terms of y
  y = coordinate[1] # put in terms of x

  neighbors_coordinates = [] # empty array for coordinates
  neighbors_elements = [] # empty array for elements

  # puts "x = #{x}"
  # puts "y = #{y}"

  ref = "#{x},#{y}"

  # define neighbors in an easy way  and add them to array
  neighbors_coordinates << "#{x - 1},#{y + 1}" # nocc
  neighbors_coordinates << "#{x},#{y + 1}" # n
  neighbors_coordinates << "#{x + 1},#{y + 1}" # nori

  neighbors_coordinates << "#{x - 1},#{y}" # ori
  neighbors_coordinates << "#{x + 1},#{y}" # occ

  neighbors_coordinates << "#{x - 1},#{y - 1}" # socc
  neighbors_coordinates << "#{x},#{y - 1}" # s
  neighbors_coordinates << "#{x + 1},#{y - 1}" # sori

  # puts neighbors_coordinates.to_s.red
  # puts "neighbors coordinates for '#{x},#{y}' = #{neighbors_coordinates}"

  # traverse the neighbors coordinates of the ref
  #  to obtain the neighbors elenents of the ref
  neighbors_coordinates.each do |coordinate|
    # add the neighboor
    # print coordinate
    # print grid_hash[coordinate]
    # print grid_hash[coordinate] == nil
    (neighbors_elements << grid_hash[coordinate])
    #  if grid_hash[coordinate] != ""
    # list of neighbors elements if
  end
  # puts neighbors_elements.to_s.yellow

  # neighbors elements cleaning
  neighbors_elements
    .delete_if { |e| e == nil }
    .delete_if { |e| e.class == Integer }
    .delete_if { |e| e == "." }
  # .uniq!
  # .join

  # puts "neighbors_elements for element '#{grid_hash[ref]}' in '#{x},#{y}' = #{neighbors_elements}".blue

  # puts "neighbors for coordinates for '#{x},#{y}' = #{neighbors_coordinates}"

  # p neighbors_coordinates
  # p neighbors_elements

  # neighbors_elements.delete_if { |e| e == "" }
  [neighbors_elements, neighbors_coordinates]
  # neighbors_elements
  #   .delete { |e| e.class == Integer }

  # raise
end

def part_2(input)
  # puts "input".upcase
  # puts input
  # puts

  symbols = input
    .gsub("\n", "")
    .gsub(".", "")
    .gsub(/[0-9]/, "")
    .chars
    .uniq
  puts
  puts "symbols = #{symbols.sort}".upcase.magenta
  puts

  # PRIMERO QUE TODO NECESITAMOS UNA MATRIZ XY O IJ
  # DONDE CADA ELEMENTO TENGA UN VALOR EN 2D
  # PARA UN ELEMENTO "4" x=0 y=0 // 1er elemento del arreglo bidimensional

  @matrix_hash = {}

  matrix =
    input
      .split("\n")
      .map! do |e|
      e.chars
    end
      .map! do |line|
      line
        .map! do |e|
        (!e.to_i.zero?) || e.sum == 48 ? e.to_i : e
      end
    end
      .each.with_index do |row, i|
      row
        .each.with_index do |column_element, j|
        # now we can map with indexes(x) and row number(y) (xy grid)
        @matrix_hash["#{i},#{j}"] = column_element
      end
    end

  puts "======================================================".upcase.red
  puts "2d grid matrix hash".upcase.green
  # print the elements of the matrix hash
  p @matrix_hash
  puts
  puts "======================================================".upcase.red
  puts "2d grid INFO".upcase.green
  puts
  x_first = @matrix_hash.to_a.first
  puts "X_first = " + x_first = @matrix_hash.to_a.first.first.split(",").first.to_i.to_s
  puts "Y_first = " + y_first = @matrix_hash.to_a.first.first.split(",").last.to_i.to_s

  x_last = @matrix_hash.to_a.last
  puts "X_last = " + x_last = @matrix_hash.to_a.last.first.split(",").first.to_i.to_s
  puts "Y_last = " + y_last = @matrix_hash.to_a.last.first.split(",").last.to_i.to_s

  matrix_size = "#{y_last.to_i + 1},#{x_last.to_i + 1}"
  puts "matrix_size(y,x) = #{matrix_size.gsub(",", "x")}"

  # =================================================================
  # MATRIX RECONSTRUCTION
  # puts
  # puts
  # (0..y_last.to_i).to_a.each do |x|
  #   # puts x
  #   (0..x_last.to_i).to_a.each do |y|
  #     # print y
  #     # print " | "
  #     #     # print "| #{x},#{y} => ".green
  #     # print "#{x},#{y} => #{@matrix_hash["#{x},#{y}"]} | "
  #     print "#{@matrix_hash["#{x},#{y}"]}"
  #     sleep(0.05)
  #     # print @matrix_hash["#{x},#{y}"]
  #   end
  #   puts
  # end
  # puts
  # puts

  puts
  puts "======================================================".upcase.red
  puts "CANDIDATE NUMBERS".upcase.green
  candidate_numbers = []
  candidate_numbers_hash = {}
  temp_num_coor = []
  temp_array = []
  mark = 0

  # empezamos recorriendo los datos uno a uno
  @matrix_hash
  # .first(140)
    .each do |key, value|
    # puts "===============================================".green

    # podemos "filtrar" valores que son numero y lo que no

    # si el dato es un numero:
    # puts "mark = #{mark}"
    # puts "#{key} ==> #{value}".yellow
    # puts value.class
    if value.class == Integer
      # puts "is a num we added to candidte temp array".green
      # almacenamos los numeros encontrados
      # hacemos los # indivuales uno solo
      # temp_array[mark] << key
      temp_array << value.to_i
      temp_num_coor << key
      # "SEGUIMOS HASTA QUE EL DATO SIGUIENTE NO SEA NUMERO"
    else
      mark += 1
      # puts "string"
      # puts "todoJunto = #{temp_array.join}"

      # if temp_array != ""
      candidate_numbers << temp_array.join
      candidate_numbers_hash[mark] =
        { num: temp_array.join,
          coor: temp_num_coor,
          neighbors: [],
          neighbors_coordinates: [] }
      temp_array = []
      temp_num_coor = []
      # end
    end
  end

  candidate_numbers.select! { |num| num != "" }
  puts "candidate_numbers = #{candidate_numbers}"

  candidate_numbers_hash
    .delete_if do |key, value|
    value[:num] == ""
  end

  # NEIGHBORS
  # puts
  # puts "--|--|-- NEIGHBORS --|--|-- ".green
  @local_neighbors = []
  @local_neighbors_coordinates = []
  # leer cada elemento del hash de numeros
  # identifico todos los vecinos de cada numero

  candidate_numbers_hash.each do |hash|
    # puts hash.to_s.green
    hash[1][:coor].each do |coordinate|
      # print "coordinate = "
      # puts coordinate
      # USING HELPER TO FIND NEIGHBORS ELEMENTS
      @local_neighbors << neighbors(coordinate, @matrix_hash)[0]
      @local_neighbors_coordinates << neighbors(coordinate, @matrix_hash)[1]
    end
    # END OF
    hash[1][:neighbors] = @local_neighbors
    hash[1][:neighbors_coordinates] = @local_neighbors_coordinates
    @local_neighbors = []
    @local_neighbors_coordinates = []
  end

  candidate_numbers_hash.each do |index, hash|
    hash[:neighbors].delete_if do |e|
      e.empty? == true
    end
  end

  # puts

  # neighbors ready to select
  # select only the hashes with neightbors not empty
  candidate_numbers_hash.select! { |index, hash|
    hash[:neighbors] != []
  }

  sum = 0
  candidate_numbers_hash.each do |key, value|
    sum += value[:num].to_i
  end

  candidate_numbers_hash.each do |key, value|
    value[:neighbors_coordinates].flatten!.uniq!
    # .sort!
  end

  # puts
  # puts "candidate_numbers_hash = ".upcase.green
  # pp candidate_numbers_hash

  puts
  puts "======================================================".upcase.red
  puts "CANDIDATE gears".upcase.green

  # from the matrix hash we selet the one with value = *
  @matrix_hash_gear_candidates = @matrix_hash.select { |key, value| value == "*" }
  # puts
  # puts "@matrix_hash_gear_candidates = ".green
  # p @matrix_hash_gear_candidates
  @matrix_hash_gear_candidates = @matrix_hash_gear_candidates.map do |key, value|
    { key: key,
      value: value,
      adjacents: [],
      gear_ratio: 0 }
  end

  puts "candidate gears = "
  pp @matrix_hash_gear_candidates.first(5)
  puts "candidate gears =  ... "

  puts "======================================================".upcase.red
  puts
  puts "looking for shared gears".upcase.green
  # now we have the gear candidtaes coordinates
  # also we have

  puts
  @matrix_hash_gear_candidates
    .each.with_index do |gear_candidate, i|
    # puts "gear_candidate[:key] = #{gear_candidate[:key]}"
    candidate_numbers_hash.each do |key, hash|
      # print hash[:neighbors_coordinates].include?(gear_candidate[:key]) ? "true ".green : "false ".red
      if hash[:neighbors_coordinates].include?(gear_candidate[:key])
        @matrix_hash_gear_candidates[i][:adjacents] << hash[:num]
      end
      # puts
    end
    # p @matrix_hash_gear_candidates[i]
    # puts "=================================================================".magenta
  end
  @matrix_hash_gear_candidates.select! { |hash|
    hash[:adjacents].count == 2
  }

  puts @matrix_hash_gear_candidates.count.to_s.green

  # puts
  @matrix_hash_gear_candidates.each { |hash|
    hash[:adjacents].map! do |string|
      string.to_i
    end
  }

  # puts
  @matrix_hash_gear_candidates.each.with_index { |hash, i|
    @matrix_hash_gear_candidates[i][:gear_ratio] = hash[:adjacents][0] * hash[:adjacents][1]
  }

  # puts
  @gear_ratio_sum = 0
  pp @matrix_hash_gear_candidates.each.with_index { |hash, i|
    @gear_ratio_sum += @matrix_hash_gear_candidates[i][:gear_ratio]
  }
  p @gear_ratio_sum
end

# part_2(test_var_part_1)
part_2(INPUT)
