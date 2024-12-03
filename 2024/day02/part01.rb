require_relative "helper"

#set the input
# file_path = ("./input_example.txt") # EXAMPLE
file_path = ("./input.txt") # CHALLENGE
# open the file
file = File.open(file_path)
# read the file
input_text = file.read

# split input_text by \n to have arrays
@document = input_text.split("\n").map do |e|
  # split array content by spaces
  # to get individual elements
  e.split(" ")
end

# convert individual elements from string to numbers
@document.each do |report|
  report.map! do |level|
    level.to_i
  end
end

@document.map! do |report|
  isReportsafe?(report)
end

puts @document.sum
