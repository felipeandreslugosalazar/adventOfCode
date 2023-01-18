list_of_all_items = "vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw"

# CONVERT INPUT TO AN ARRAY of ARRAYS
list_of_all_items = list_of_all_items
  .split("\n")
  .map! { |r| r.split("") }

# DIVIDE EACH RUCKSACK IN 2 (COMPARTMENTS)
# WITH EQUAL QUANTITY OF ELEMENTS

# HELPER DEF
def split_in_half(array)
  comp1 = array.slice(0, array.length / 2)
  comp2 = array.slice((array.length / 2), array.length)
  [comp1, comp2]
end

list_of_all_items.map! do |rucksack|
  split_in_half(rucksack)
end

# COMPARE COMPARTMENTS PER RUCKSACK AND FIND THE REPEATED
def compare_and_get_diff(array)
  diff = array[0] - array[1]
  (array[0] - diff).uniq
end

# FIND PRIO PER REPEATED ELEMENT
list_of_all_items.map! do |rucksack|
  compare_and_get_diff(rucksack).join
end

# DEFINE PRIO RULZ (HASH)
#   Lowercase item types a through z have priorities 1 through 26.
#   Uppercase item types A through Z have priorities 27 through 52.

min_prio = ("a".."z").to_a.each_with_index.to_h { |k, i| [k, i + 1] }
may_prio = ("A".."Z").to_a.each_with_index.to_h { |k, i| [k, i + 27] }
prio = min_prio.merge(may_prio)

list_of_all_items.map! { |r| prio[r] }

# SUM THE PRIOS
# GIVE THE ANSWER
p list_of_all_items.sum
