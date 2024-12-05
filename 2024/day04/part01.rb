require "colorize"
require_relative "helper"

#set the input
file_path = ("./input.txt") # CHALLENGE
# file_path = ("./input_example1.txt") # EXAMPLE
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

#
@counters = {
  xmas_lef_to_right: 0,
  xmas_right_to_left: 0,
  xmas_up_to_down: 0,
  xmas_down_to_up: 0,

  xmas_diag_up_front: 0,
  xmas_diag_down_front: 0,
  xmas_diag_down_back: 0,
  xmas_diag_up_back: 0,
}

# travel the grid looking for XMAS
# #
# horizontal →
# vertical ↑ ↓
# diagonal ↖ ↗
# diagonal ↙ ↘
# written backwards ←
# or even overlapping other words
@grid_map.each do |coordinate, value|
  letsCount(coordinate, @grid_map, @counters)
end

# puts "x,y".green
# pp @counters
p @counters.sum { |k, v| v }
