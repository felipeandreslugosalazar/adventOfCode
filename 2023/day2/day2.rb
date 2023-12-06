require_relative "vars"

# Determine which games would have been possible if the bag had been loaded with only 12 red cubes, 13 green cubes, and 14 blue cubes. What is the sum of the IDs of those games?

test_var_2_1 = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"

def part_1(input)
  max = {
    "r" => 12,
    "g" => 13,
    "b" => 14,
  }

  input
    .split("\n")
    .map! { |game|
    game
      .gsub("Game ", "")
      .gsub(/;|,|:/, ",").gsub("red", "r")
      .gsub("green", "g").gsub("blue", "b")
      .gsub(", ", ",").gsub(" ", "")
      .split(",")
  }
    .map! { |game| game.slice(1, game.length) }
    .map! { |e|
    e.map! do |variable|
      variable.scan(/\d+|\D+/)
        .reverse
    end
  }
    .map! do |e|
    e.map! do |f, l|
      [f, l.to_i]
    end
  end
  #
    .map!.with_index do |sets, i|
    final_hash = {}
    sets.each do |k, v|
      # k = set[0]
      # v = set[1]
      if final_hash[k].nil?
        final_hash[k] = v
      else
        final_hash[k] = [final_hash[k], v].max
      end
    end
    final_hash
  end
    .map!.with_index do |rgb, i|
    [i + 1,
     (rgb["r"] <= max["r"] && rgb["g"] <= max["g"] && rgb["b"] <= max["b"])]
  end
  # [1,2,3,4,5,6].select { |n| n.even? }
    .select { |pair| pair[1] == true }
    .join
    .split("true")
    .map! { |e| e.to_i }
    .sum
end

# pp part_1(test_var_2_1)
# pp part_1(INPUT)

# Determine which games would have been possible if the bag had been loaded with only 12 red cubes, 13 green cubes, and 14 blue cubes. What is the sum of the IDs of those games?

test_var_2_2 = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"

def part_2(input)
  max = {
    "r" => 12,
    "g" => 13,
    "b" => 14,
  }

  input
    .split("\n")
    .map! { |game|
    game
      .gsub("Game ", "")
      .gsub(/;|,|:/, ",").gsub("red", "r")
      .gsub("green", "g").gsub("blue", "b")
      .gsub(", ", ",").gsub(" ", "")
      .split(",")
  }
    .map! { |game| game.slice(1, game.length) }
    .map! { |e|
    e.map! do |variable|
      variable.scan(/\d+|\D+/)
        .reverse
    end
  }
    .map! do |e|
    e.map! do |f, l|
      [f, l.to_i]
    end
  end
  #
    .map!.with_index do |sets, i|
    final_hash = {}
    sets.each do |k, v|
      # k = set[0]
      # v = set[1]
      if final_hash[k].nil?
        final_hash[k] = v
      else
        final_hash[k] = [final_hash[k], v].max
      end
    end
    final_hash
  end
    .map! { |rgb| [rgb["r"], rgb["g"], rgb["b"]] }
    .map! { |r, g, b| r * g * b }
  # # [1,2,3,4,5,6].select { |n| n.even? }
  #   .select { |pair| pair[1] == true }
  #   .join
  # .split("true")
  # .map! { |e| e.to_i }
    .sum
end

# pp part_2(test_var_2_2)
pp part_2(INPUT)

# 4 red, 2 green, and 6 blue cubes.
# 1 red, 3 green, and 4 blue cubes.
# 20 red, 13 green, and 6 blue cubes.
# 14 red, 3 green, and 15 blue cubes.
# 6 red, 3 green, and 2 blue cubes in the bag.
