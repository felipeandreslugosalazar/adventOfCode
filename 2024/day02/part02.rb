require_relative "helper"
require_relative "helper2"

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

# p @document
@new_document = []

# puts "**************************************".green
@document.each do |report|

  # problem_dampener(report)
  @report = report

  if isReportsafe?(@report)
    @new_document << @report
  else
    # puts "UNSAFE"
    problem_dampener(@report)
  end
  # puts "**************************************".green
end

p @new_document.count
