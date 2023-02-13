require "colorize"
require_relative "input"
require_relative "helper"

def run_circuit(instructions, dictionary)
  @instructions = instructions
  @dictionary = dictionary

  @instructions.each do |instruction|
    length_filter(instruction, @dictionary)
  end
  @dictionary
  @dictionary.select { |k, v| v > 0 }
end
