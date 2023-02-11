# PART 01 - DAY 06

# Because your neighbors keep defeating you in the holiday house decorating contest year after year,
#  you've decided to deploy one million lights in a 1000x1000 grid.

# 999
# ^
# |
# 0 --> 999

# THIS IS  THE LIGHTS GRID
# (999,0)---(999,999)
#   |        |
#   |        |
#   |        |
#   |        |
# (0,0)---(0,999)

# The instructions include whether to turn on, turn off, or toggle various inclusive ranges given as coordinate pairs.
# Each coordinate pair represents opposite corners of a rectangle, inclusive; a coordinate pair like 0,0 through 2,2
#  therefore refers to 9 lights in a 3x3 square. The lights all start turned off.

require_relative "helper_part_01"
require_relative "input"

def how_many_lights_are_lit
  @grid = Grid.new(999, 999)

  @instructions_for_the_ideal_lighting_configuration.each.with_index do |set, i|
    @grid.lights_secuence(set)
  end
  puts
  @grid.number_of_lights_on
end

puts "How many lights are lit ? " + how_many_lights_are_lit.to_s
