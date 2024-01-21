require "matrix"
require "colorize"
require_relative "vars"

test_var_part_1 = "467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598.
"

def part_1(input)
  puts "input".upcase
  puts
  puts input
  puts

  symbols = input
    .gsub("\n", "")
    .gsub(".", "")
    .gsub(/[0-9]/, "")
    .chars
    .uniq
  puts
  puts "symbols = #{symbols}"
  puts

  # PRIMERO QUE TODO NECESITAMOS UNA MATRIZ XY O IJ
  # DONDE CADA ELEMENTO TENGA UN VALOR EN 2D
  # PARA UN ELEMENTO "4" x=0 y=0 // 1er elemento del arreglo bidimensional

  matrix_hash = {}
  matrix =
    input
      .split("\n")
      .map! { |e| e.chars }
      .map! { |line| line.map! { |e| !e.to_i.zero? ? e.to_i : e } }
      .each.with_index do |row, i|
      row
        .each.with_index do |column_element, j|
        # now we can map with indexes(x) and row number(y) (xy grid)
        matrix_hash["#{i},#{j}"] = column_element
      end
    end

  matrix_hash
    .first(10)

  x_first = matrix_hash.to_a.first
  puts "X_first = " + x_first = matrix_hash.to_a.first.first.split(",").first.to_i.to_s
  puts "Y_first = " + y_first = matrix_hash.to_a.first.first.split(",").last.to_i.to_s

  x_last = matrix_hash.to_a.last
  puts "X_last = " + x_last = matrix_hash.to_a.last.first.split(",").first.to_i.to_s
  puts "Y_last = " + y_last = matrix_hash.to_a.last.first.split(",").last.to_i.to_s

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
  #     # print "#{x},#{y} => #{matrix_hash["#{x},#{y}"]} | "
  #     print "#{matrix_hash["#{x},#{y}"]}"
  #     sleep(0.05)
  #     # print matrix_hash["#{x},#{y}"]
  #   end
  #   puts
  # end
  # puts
  # puts

  candidate_numbers = []
  candidate_numbers_hash = {}
  temp_num_coor = []
  temp_array = []

  p mark = 0
  matrix_hash
    .first(9)
  # empezamos recorriendo los datos uno a uno
    .each do |key, value|
    puts "===============================================".green

    # podemos "filtrar" valores que son numero y lo que no

    # si el dato es un numero:
    puts "mark = #{mark}"
    puts "#{key} ==> #{value}"

    if value.class == Integer
      puts "num"
         # almacenamos los numeros encontrados
         # hacemos los # indivuales uno solo
      # temp_array[mark] << key
      p temp_array << value.to_i
      p temp_num_coor << key
      # "SEGUIMOS HASTA QUE EL DATO SIGUIENTE NO SEA NUMERO"
    else
      mark += 1
      puts "string"
      puts "todoJunto = #{temp_array.join}"

      if temp_array != ""
        p candidate_numbers << temp_array.join
        p candidate_numbers_hash[mark] = { num: temp_array.join, coor: temp_num_coor }
        puts temp_array = []
        puts temp_num_coor = []
      end
    end
  end
  candidate_numbers.select! { |num| num != "" }

  puts "candidate_numbers = #{candidate_numbers}"
  puts "candidate_numbers_hash = #{candidate_numbers_hash}"

  # =================================================================
  # raise "This is just a RAISE to stop execution".upcase
  # =================================================================

  # processamos indices -> buscamos por cada numero sus datos vecinos
  # ACA TENDREMOS UNA SUBRUTINA DE BUSQUEDA DE VECINOS
  # CONSIDERANDO QUE EL NUMERO SEA ESQUINA BORDE O RODEADO
  # una vez se tengan los vecinos
  # procedemos a limpiar los datos
  # y si un vecino es simbolo el numero se queda

end

part_1(test_var_part_1)
# part_1(INPUT)
