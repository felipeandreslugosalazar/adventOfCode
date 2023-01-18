#     [D]
# [N] [C]
# [Z] [M] [P]
#  1   2   3

# move 1 from 2 to 1
# move 3 from 1 to 3
# move 2 from 2 to 1
# move 1 from 1 to 2

# there must be a wy to translate the graphic into readable data ???
# right now we do it manually

stacks = [
  ["Z", "N"], # stack no.1
  ["M", "C", "D"], # stack no.2
  ["P"], # stack no.3
]

# transform instructions to readabe data
# each line to an array element

instructions = "move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2"

p instructions = instructions
    .gsub!(/[a-z\n]/, "")
    .split(" ")
  # map to integers
    .map { |e| e.to_i }
  # group by 3
    .each_slice(3).map { |e| e }

instructions.each do |instruction|
  number_of_crates = instruction[0]
  from = instruction[1] - 1
  to = instruction[2] - 1

  # move 1 from 2 to 1
  crane = []

  number_of_crates.times do
    # TAKE from
    crane << stacks[from].last
    # move from
    stacks[from].pop
    # move to
    stacks[to].push(crane.last)
    crane.pop
  end
  p stacks
end

stacks.map! do |stack|
  stack.last
end

p stacks.join
