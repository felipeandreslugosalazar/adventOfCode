# PART 2
# In how many assignment pairs do the ranges overlap?
# here there are 4 groups overlapped

input = "2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8"

# how can i identify the ranges overlap?
# intersection ?

input = input
  .split
  .join(" ")
  .gsub(",", " ")
  .gsub("-", " ")
  .split()
  .map! { |e| e.to_i }

def array_in_groups_of_n(array, number_of_elements_per_group)
  new_array = []
  i = 0
  (array.length / number_of_elements_per_group).times do
    new_array << array.slice(i, number_of_elements_per_group)
    i += number_of_elements_per_group
  end
  new_array
end

input = array_in_groups_of_n(input, 4)

def overlapped(group)
  first = group[0]
  second = group[1]
  third = group[2]
  fourth = group[3]
  st = (first..second).to_a
  nd = (third..fourth).to_a

  # ([first..second].to_a).intersection([third..fourth].to_a)
  !st.intersection(nd).empty? ? 1 : 0
end

input.map! { |group| overlapped(group) }

input
p input.sum
