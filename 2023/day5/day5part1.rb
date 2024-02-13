require "colorize"
require_relative "vars"
require_relative "helper"

# initialize the seed list
# seed number as key
# plus soil
initialize_list
seed_to_soil_map # and save data to list
soil_to_fertilizer_map # and save data to list
fertilizer_to_water_map
water_to_light_map
light_to_temperature_map
temperature_to_humidity_map
humidity_to_location_map

puts "--- right values for seeds ---".upcase.green
puts "Seed 13, soil 13, fertilizer 52, water 41, light 34, temperature 34, humidity 35, location 35.".green
puts "Seed 14, soil 14, fertilizer 53, water 49, light 42, temperature 42, humidity 43, location 43.".green
puts "Seed 55, soil 57, fertilizer 57, water 53, light 46, temperature 82, humidity 82, location 86.".green
puts "Seed 79, soil 81, fertilizer 81, water 81, light 74, temperature 78, humidity 78, location 82.".green
puts
