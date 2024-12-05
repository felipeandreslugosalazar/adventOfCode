require "colorize"
require_relative "helper"
require_relative "helper2"

#set the input
file_path = ("./input.txt") # CHALLENGE
# file_path = ("./input_example2.txt") # EXAMPLE
# open the file
file = File.open(file_path)
# read the file
input_text = file.read

# raw input => string
@paper_sheet = input_text
# array of full strings
  .split("\n")
# to an array of chars
  .map! { |line| line.chars }
# data ready to be process
# p @paper_sheet

# map the paper sheet to a coordinates (x,y) #helper
@grid_map = grid_mapper(@paper_sheet)

@counters = {
  x_mas: 0,
}

# diagonal ↖   ↗
#          S   M
#            A
#          S   M
# diagonal ↙   ↘
@grid_map.each do |coordinate, value|
  lets_find_X_M_A_S(coordinate, @grid_map, @counters)
end

# puts "x,y".green
# pp @counters
p @counters.sum { |k, v| v }
