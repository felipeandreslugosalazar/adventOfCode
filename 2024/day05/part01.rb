require "colorize"
require_relative "helper01"

#set the input
# open the file
# read the file
# file_path = ("./input_a.txt") # CHALLENGE

# raw input => string
@PAGES_ORDERING_RULES = File.open("./input_rules.txt").read
@PAGES_ORDERING_RULES = File.open("./input_example_1_rules.txt").read
# array of full strings
  .split("\n")
  .map! { |raw_pair| raw_pair.split("|") }
  .map! { |subarray| subarray.map!(&:to_i) }
# data ready to be process
# => [[47, 53],[97, 13]...
  .sort_by { |subarray| [subarray[0], subarray[1]] }
# p @PAGES_ORDERING_RULES #array

# raw input => string
@PAGES_UPDATE = File.open("./input_pages.txt").read
@PAGES_UPDATE = File.open("./input_example_1_pages.txt").read
  .split("\n")
  .map! { |string| string.split(",") }
  .map! { |subarray| subarray.map!(&:to_i) }

# =============================================
# =============================================
# pp @PAGES_UPDATE.count

# @start_time = Time.now

@PAGES_UPDATE.each.with_index do |page_update, index|
  # puts "**********************************************".magenta
  print ".".green
  # print (index + 1).to_s.magenta + ". "
  # puts page_update.to_s.magenta

  @PAGES_UPDATE.select! do |page_update|
    # puts is_page_update_in_correct_order?(@PAGES_ORDERING_RULES, page_update) ? page_update.to_s.green : page_update.to_s.red
    is_page_update_in_correct_order?(@PAGES_ORDERING_RULES, page_update)
  end
end
  .map! { |page_update| page_update[page_update.length / 2] }

# pp @PAGES_UPDATE.count
pp @PAGES_UPDATE.sum

# @end_time = Time.now

# puts "Total time: #{(@end_time - @start_time)} segs."
