list_of_all_items = "vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw"

# we create an array where each line of the input is an element
list_of_all_items = list_of_all_items
  .split("\n")
  .map! do |item|
  item.split("")
end
# we remove the duplicated items
  .map! do |e|
  e.uniq
end

# we need to create groups of 3
# ruby method ?
# => manual

def array_in_groups_of_n(array, number_of_elements_per_group)
  new_array = []
  i = 0
  (array.length / number_of_elements_per_group).times do
    new_array << array.slice(i, number_of_elements_per_group)
    # puts "slice(#{i}, #{number_of_elements_per_group})"
    i += number_of_elements_per_group
  end
  new_array
end

grouped = array_in_groups_of_n(list_of_all_items, 3)

# # identify the common element
grouped.map! do |group|
  group[0].intersection(group[1].intersection(group[2])).join
end

grouped

# # apply prio

min_prio = ("a".."z").to_a.each_with_index.to_h { |k, i| [k, i + 1] }
may_prio = ("A".."Z").to_a.each_with_index.to_h { |k, i| [k, i + 27] }
prio = min_prio.merge(may_prio)

grouped.map! do |e|
  prio[e]
end
grouped

# # answer

p grouped.sum
