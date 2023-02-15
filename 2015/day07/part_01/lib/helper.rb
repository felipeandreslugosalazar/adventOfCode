def length_filter(instruction, dictionary)
  @instruction = instruction
  @dictionary = dictionary

  if @instruction.length == 2
    wires_dic_value_set_up(@instruction, @dictionary)
  elsif @instruction.length == 3 # NOT
    operation_not(@instruction, @dictionary)
  else # AND OR LSHIFT RSHIFT
    other_operations(@instruction, @dictionary)
  end
end

def other_operations(instruction, dictionary)
  @instruction = instruction
  @dictionary = dictionary

  output = @instruction[0]
  a = @instruction[1]
  operator = @instruction[2]
  b = @instruction[3]

  @dictionary[output] = "#{a} #{operator} #{b}"

  # case operator
  # when "&"
  #   # @dictionary[output] = @dictionary[a] & @dictionary[b]
  #    @dictionary[output] = "#{a} #{operator} #{b}"
  #   when "|"
  #     # dictionary[output] = dictionary[a] | dictionary[b]
  #     @dictionary[output] = "#{a} #{operator} #{b}"
  # when "<<"
  #   # (a, operator, b, output)
  #   # ["x", "LSHIFT", "2", "f"]
  #   # f = x << 2
  #   dictionary[output] = dictionary[a] << b.to_i
  # else # ">>"
  #   # (a, operator, b, output)
  #   # ["y", "RSHIFT", "2", "g"]
  #   # g = y >> 2
  #   dictionary[output] = dictionary[a] >> b.to_i
  # end
end

def operation_not(instruction, dictionary)
  @instruction = instruction
  @dictionary = dictionary

  output = instruction[0]
  operator = instruction[1]
  a = instruction[2]

  max_16_bit_integer = 65535
  # (operator, a, output)
  # ["NOT", "x", "h"]
  # NOT x -> h

  # p dictionary[output] = ~dictionary[a]
  # @dictionary[output] = max_16_bit_integer - @dictionary[a]
  @dictionary[output] = "#{operator} #{a}"
end

def wires_dic_value_set_up(instruction, dictionary)
  @instruction = instruction
  @dictionary = dictionary

  key = instruction[0]
  value = instruction[1]

  @dictionary[key] = value.to_i
end
