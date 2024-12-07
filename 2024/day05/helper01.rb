# require_relative "part01"
require "colorize"
#

def is_page_update_in_correct_order?(pages_rules, page_update)

  # pp pages_rules
  @combinations = page_update_combinations(page_update)
  @correct_order = true

  @combinations.each do |xy|
    # p xy
    # p "==> #{x} #{y}"
    # p pair
    if pages_rules.include?(xy)
      # puts xy.to_s.green
    else
      @correct_order = false
      # puts xy.to_s.red
      break
    end
  end
  # p @correct_order
  @correct_order
end

def page_update_combinations(array)
  combinations = []

  temp_array = array.dup

  array.each.with_index do |a_element, index|
    # puts a_element.to_s.yellow

    temp_array.slice!(0)
    # p temp_array

    # here we combine elements
    temp_array.each do |t_element|
      combinations << [a_element, t_element]
    end
    # puts
  end
  # p combinations
  combinations
end
