instructions = "move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2"

instructions = instructions
  .gsub!(/[a-z\n]/, "")
  .split(" ")
# map to integers
  .map! { |e| e.to_i }
# group by 3
  .each_slice(3).map { |e| e }

print "instructions => "
p instructions

print "stacks => "
p stacks = [
  ["Z", "N"], # stack no.1
  ["M", "C", "D"], # stack no.2
  ["P"], # stack no.3
]

instructions.each do |instruction|
  number_of_crates = instruction[0]
  from = instruction[1] - 1
  to = instruction[2] - 1

  crane = []

  # number of crates to move
  if number_of_crates == 1
    # TAKE from
    crane << stacks[from].last
    # move from
    stacks[from].pop
    # move to
    stacks[to].push(crane.last)
    crane.pop
  else
    number_of_crates.times do
      crane << stacks[from].last
      # REmove it from old stack
      stacks[from].pop
      # move it to new stack
      # print "into crane => "
      # p crane
    end
    number_of_crates.times do
      stacks[to].push(crane.last)
      crane.pop
    end
    crane = []
  end
  # pp stacks
end

print "final => "
pp stacks

stacks.map! do |stack|
  stack.last
end

p stacks.join