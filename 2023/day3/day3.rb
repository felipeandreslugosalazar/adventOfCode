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
# puts test_var_part_1 = "467.
# ...*
# ..35
# ...$
# "

def part_1(input)
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
  # DONDE CADA ELEMENTO TENGA  UN VALOR EN 2D
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

  # p matrix_hash
  # .first(15)

  # p x_first = matrix_hash.to_a.first
  # print "X_first = "
  # p x_first = matrix_hash.to_a.first.first.split(",").first.to_i
  # print "Y_first = "
  # p y_first = matrix_hash.to_a.first.first.split(",").last.to_i

  # p x_last = matrix_hash.to_a.last
  # print "X_last = "
  # p x_last = matrix_hash.to_a.last.first.split(",").first.to_i
  # print "Y_last = "
  # p y_last = matrix_hash.to_a.last.first.split(",").last.to_i
  # matrix_size = "#{y_last + 1},#{x_last + 1}"
  # p "matrix_size(y,x) = #{matrix_size.gsub(",", "x")}"

  # =================================================================
  # MATRIX RECONSTRUCTION
  # puts
  # puts
  # (0..y_last).to_a.each do |x|
  #   # puts x
  #   (0..x_last).to_a.each do |y|
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
  # =================================================================

  candidate_numbers = []
  temp_num_coor = []
  matrix_hash
  # empezamos recorriendo los datos uno a uno
  # podemos "filtrar" valores que son numero y lo que no
    .first(20)
    .each do |key, value|
    puts "===============================================".green
    sleep(0.4)
    index = 0
    temp_array = [[], []]
    # si el dato es un numero:
    if value.to_i != 0
      # seguimos hasta que el dato siguiente no sea numero
      # almacenamos los numeros encontrados
      # hacemos los # indivuales uno solo
      temp_array[index][0] << key
      temp_array[index][1] << value
      # p "#{key}=>#{value}"
      # sleep(0.3)
    else
      candidate_numbers << temp_array
      temp_array = [[], []]
      index += 1
    end
    p temp_array
  end
  # processamos indices -> buscamos por cada numero sus datos vecinos
  # ACA TENDREMOS UNA SUBRUTINA DE BUSQUEDA DE VECINOS
  # CONSIDERANDO QUE EL NUMERO SEA ESQUINA BORDE O RODEADO
  # una vez se tengan los vecinos
  # procedemos a limpiar los datos
  # y si un vecino es simbolo el numero se queda

end

part_1(test_var_part_1)
# part_1(INPUT)
