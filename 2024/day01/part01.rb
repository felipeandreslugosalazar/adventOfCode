#set the input
file_path = ("./input.txt")
# open the file
file = File.open(file_path)
# read the file
file_data = file.read

# split file_data by \n to have an arrays
@array = file_data.split("\n").map do |e|
  # split file line by space
  e.split(" ")
end

# convert nested array to numbers
@array.each do |array_e|
  array_e.map! do |num|
    num.to_i
  end
end

@array1 = []
@array2 = []
# separate elements in two arrays
@array.each do |array_e|
  # p array_e
  @array1 << array_e.first
  @array2 << array_e.last
end

@array1.sort!
@array2.sort!

@array3 = []

@array1.each.with_index do |array_1_e, index|
  dist = array_1_e > @array2[index] ? array_1_e - @array2[index] : @array2[index] - array_1_e
  @array3 << dist
end

# @array3
p @array3.sum

# => 1646452
