#                -y (up)
#                 |
#                 |
#                 |   ↗
#               M | S
# (BACK)-x ------ A ---- +x (front)
#               M | S
#                 |
#                 |
#                 |
#                +y (down)

# MAS
# 1 ↗
def mas_diag_down_up__back_front?(coordinate, dic, counters)
  x = coordinate.split(",").first.to_i
  y = coordinate.split(",").last.to_i

  if (dic[coordinate] == "A" &&
      dic["#{x + 1},#{y - 1}"] == "S" &&
      dic["#{x - 1},#{y + 1}"] == "M")
    # puts coordinate.green
    true
  else
    # puts coordinate.red
  end
end

# 2 ↘
def mas_diag_up_down__back_front?(coordinate, dic, counters)
  x = coordinate.split(",").first.to_i
  y = coordinate.split(",").last.to_i

  if (dic[coordinate] == "A" &&
      dic["#{x + 1},#{y + 1}"] == "S" &&
      dic["#{x - 1},#{y - 1}"] == "M")
    # puts coordinate.green
    true
  end
end

# 3 ↙
def mas_diag_up_down__front_back?(coordinate, dic, counters)
  x = coordinate.split(",").first.to_i
  y = coordinate.split(",").last.to_i

  if (dic[coordinate] == "A" &&
      dic["#{x - 1},#{y + 1}"] == "S" &&
      dic["#{x + 1},#{y - 1}"] == "M")
    # puts coordinate.green
    true
  end
end

# 4 ↖
def mas_diag_down_up__front_back?(coordinate, dic, counters)
  x = coordinate.split(",").first.to_i
  y = coordinate.split(",").last.to_i

  if (dic[coordinate] == "A" &&
      dic["#{x - 1},#{y - 1}"] == "S" &&
      dic["#{x + 1},#{y + 1}"] == "M")
    # puts coordinate.green
    true
  end
end

def lets_find_X_M_A_S(coordinate, dic, counters)
  ↗ = mas_diag_down_up__back_front?(coordinate, dic, counters)
  ↘ = mas_diag_up_down__back_front?(coordinate, dic, counters)
  ↙ = mas_diag_up_down__front_back?(coordinate, dic, counters)
  ↖ = mas_diag_down_up__front_back?(coordinate, dic, counters)

  if (↗ || ↙) && (↘ || ↖)
    # puts coordinate.green
    counters[:x_mas] += 1
  end
end
