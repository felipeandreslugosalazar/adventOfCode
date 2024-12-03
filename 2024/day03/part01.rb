#set the input
file_path = ("./input_example.txt") # EXAMPLE
# file_path = ("./input.txt") # CHALLENGE
# open the file
file = File.open(file_path)
# read the file
input_text = file.read

@instructions = input_text
  .scan(/mul\({1}\d{1,3},\d{1,3}\){1,3}/)
  .map! { |instruction| instruction.gsub(/[mul(), ]/, " ").strip.split }
  .map! { |first_num, last_num| [first_num.to_i, last_num.to_i] }
  .map! { |first_num, last_num| first_num * last_num }
  .sum

p @instructions
