def numbers_of_characters_code(string)
  @string = string
  p @string.split("").count == 0 ? 2 : @string.split("").count + 2
end

def numbers_of_characters_string(string)
  @string = string
  p @string.split("").count
end

a = ["pie", "cookies", "soda", "icecream"]
