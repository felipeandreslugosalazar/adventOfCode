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

# @array1
# @array2

@array3 = []
@dic = {}

@array1.each do |e1|
  @dic[e1] = 0
  e2_count = 0
  @array2.each do |e2|
    # [1, 2, 3, 3, 3, 4]
    # [3, 3, 3, 4, 5, 9]

    # empezamos con e1 = 1
    # y ahora recorremos array2
    # si el elmento de a2 es igual a e1 +1

    if e1 == e2
      e2_count = e2_count + 1
    end
  end
  @array3 << e1 * e2_count
end

# p @array3
p @array3.sum
