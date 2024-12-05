def grid_mapper(array)
  @array = array
  @dic = {}

  # matrix
  # x = row
  # y = column
  @array.each.with_index do |row, y|
    row.each.with_index do |column_e, x|
      # puts "(#{i},#{j}) = #{column_e}"
      @dic["#{x},#{y}"] = column_e
    end
  end

  return @dic
end

# create functions to scan and locate
# the positions of christmas
def xmas_lef_to_right(coordinate, dic, counters)
  # TODO: this block appears many times... refactor !
  x = coordinate.split(",").first.to_i
  y = coordinate.split(",").last.to_i
  #
  if dic[coordinate] == "X" &&
     dic["#{x + 1},#{y}"] == "M" &&
     dic["#{x + 2},#{y}"] == "A" &&
     dic["#{x + 3},#{y}"] == "S"
    # puts coordinate.green

    # p counters
    counters[:xmas_lef_to_right] += 1
  else
    # puts coordinate.red
  end
end

def xmas_right_to_left(coordinate, dic, counters)
  x = coordinate.split(",").first.to_i
  y = coordinate.split(",").last.to_i

  if dic[coordinate] == "X" &&
     dic["#{x - 1},#{y}"] == "M" &&
     dic["#{x - 2},#{y}"] == "A" &&
     dic["#{x - 3},#{y}"] == "S"
    # puts coordinate.green

    # p counters
    counters[:xmas_right_to_left] += 1
  else
    # puts coordinate.red
  end
end

def xmas_up_to_down(coordinate, dic, counters)
  x = coordinate.split(",").first.to_i
  y = coordinate.split(",").last.to_i

  if dic[coordinate] == "X" &&
     dic["#{x},#{y + 1}"] == "M" &&
     dic["#{x},#{y + 2}"] == "A" &&
     dic["#{x},#{y + 3}"] == "S"
    # puts coordinate.green

    # p counters
    counters[:xmas_up_to_down] += 1
  else
    # puts coordinate.red
  end
end

def xmas_down_to_up(coordinate, dic, counters)
  x = coordinate.split(",").first.to_i
  y = coordinate.split(",").last.to_i

  if dic[coordinate] == "X" &&
     dic["#{x},#{y - 1}"] == "M" &&
     dic["#{x},#{y - 2}"] == "A" &&
     dic["#{x},#{y - 3}"] == "S"
    # puts coordinate.green

    # p counters
    counters[:xmas_down_to_up] += 1
  else
    # puts coordinate.red
  end
end

def xmas_diag_down_front(coordinate, dic, counters)
  x = coordinate.split(",").first.to_i
  y = coordinate.split(",").last.to_i

  if dic[coordinate] == "X" &&
     dic["#{x + 1},#{y + 1}"] == "M" &&
     dic["#{x + 2},#{y + 2}"] == "A" &&
     dic["#{x + 3},#{y + 3}"] == "S"
    # puts coordinate.green

    # p counters
    counters[:xmas_diag_down_front] += 1
  else
    # puts coordinate.red
  end
end

def xmas_diag_up_front(coordinate, dic, counters)
  x = coordinate.split(",").first.to_i
  y = coordinate.split(",").last.to_i

  if dic[coordinate] == "X" &&
     dic["#{x + 1},#{y - 1}"] == "M" &&
     dic["#{x + 2},#{y - 2}"] == "A" &&
     dic["#{x + 3},#{y - 3}"] == "S"
    # puts coordinate.green

    # p counters
    counters[:xmas_diag_up_front] += 1
  else
    # puts coordinate.red
  end
end

def xmas_diag_down_back(coordinate, dic, counters)
  x = coordinate.split(",").first.to_i
  y = coordinate.split(",").last.to_i

  if dic[coordinate] == "X" &&
     dic["#{x - 1},#{y + 1}"] == "M" &&
     dic["#{x - 2},#{y + 2}"] == "A" &&
     dic["#{x - 3},#{y + 3}"] == "S"
    # puts coordinate.green

    # p counters
    counters[:xmas_diag_down_back] += 1
  else
    # puts coordinate.red
  end
end

def xmas_diag_up_back(coordinate, dic, counters)
  x = coordinate.split(",").first.to_i
  y = coordinate.split(",").last.to_i

  if dic[coordinate] == "X" &&
     dic["#{x - 1},#{y - 1}"] == "M" &&
     dic["#{x - 2},#{y - 2}"] == "A" &&
     dic["#{x - 3},#{y - 3}"] == "S"
    # puts coordinate.green

    # p counters
    counters[:xmas_diag_up_back] += 1
  else
    # puts coordinate.red
  end
end

def letsCount(coordinate, dic, counters)
  xmas_lef_to_right(coordinate, dic, counters)
  xmas_right_to_left(coordinate, dic, counters)
  xmas_up_to_down(coordinate, dic, counters)
  xmas_down_to_up(coordinate, dic, counters)

  xmas_diag_down_front(coordinate, dic, counters)
  xmas_diag_up_front(coordinate, dic, counters)
  xmas_diag_down_back(coordinate, dic, counters)
  xmas_diag_up_back(coordinate, dic, counters)
end
