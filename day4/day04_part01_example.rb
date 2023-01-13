input = "2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8"

# HOW DO WE TRANSFORM THE DATA TO MAKE IT MORE MANAGEABLE
# i wanto to have easy access to the first and last element in the group
input = input
  .split
  .join(" ")
  .gsub(",", " ")
  .gsub("-", " ")
  .split()
  .map! { |e| e.to_i }

# Some of the pairs have noticed that one of their assignments fully contains the other. For example, 2-8 fully contains 3-7, and 6-6 is fully contained by 4-6. In pairs where one assignment fully contains the other, one Elf in the pair would be exclusively cleaning sections their partner will already be cleaning, so these seem like the most in need of reconsideration. In this example, there are 2 such pairs.

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

input

def is_assigment_contained(array)
  # [2, 4, 6, 8]F

  first = array[0]
  second = array[1]
  third = array[2]
  fourth = array[3]
  # .234....
  # .....678

  # ...f........u.. (1,2)
  # .....f....u.... (3,4)
  # if first <= third && second >= fourth
  #   1
  #   # .....f....u.... (3,4)
  #   # ...f........u.. (1,2)
  # elsif first >= third && second <= fourth
  #   1
  # else
  #   0
  # end

  (first <= third && second >= fourth) || (first >= third && second <= fourth) ? 1 : 0
end

input.map! do |group|
  is_assigment_contained(group)
end

pp input

p input
    .sum
