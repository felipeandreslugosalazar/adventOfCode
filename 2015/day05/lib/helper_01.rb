# It contains at least three vowels (aeiou only)
# => aei, xazegov, or aeiouaeiouaeiou
def it_contains_at_least_3_vowels(string)
  string.gsub(/[^aeiuo]/, "").split("").count >= 3
end

# p it_contains_at_least_3_vowels("aei")
# p it_contains_at_least_3_vowels("xazegov")
# p it_contains_at_least_3_vowels("aeiouaeiouaeiou")

# It contains at least one letter that appears twice in a row
# => like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).

# we can split the string and check if the n-1 == n.
# def at_least_one_letter_twice_in_a_row(string)
#   array = string.split("")

#   twice_in_a_row = false
#   array.each.with_index do |char, i|
#     if i > 0
#       # puts "iteration #{i} || #{array[i - 1]} == #{array[i]} =>  #{array[i - 1] == array[i]}"
#       if (array[i - 1] == array[i])
#         twice_in_a_row = true
#         break
#       else
#         twice_in_a_row
#       end
#     end
#   end
#   twice_in_a_row
# end

def at_least_one_letter_twice_in_a_row(string)
  array = string.split("")
  string.chars.each_cons(2).any? { |a, b| a == b }
end

# => like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
# p at_least_one_letter_twice_in_a_row("xx")
# p at_least_one_letter_twice_in_a_row("dd")
# p at_least_one_letter_twice_in_a_row("aabbccdd")
# p at_least_one_letter_twice_in_a_row("asdfghjk")
# p at_least_one_letter_twice_in_a_row("arabbccdd")

# It does NOT contain the strings
# ab,
# cd,
# pq,
# xy,

#  even if they are part of one of the other requirements.
def it_doesnt_contain_ab_cd_pq_xy?(string)
  # !contain = string.match?(/(ab|cd|pq|xy)/)
  !string.match?(/(ab|cd|pq|xy)/)
end

# p it_doesnt_contain_ab_cd_pq_xy?("ddddddddddalbdddddddddd")
# p it_doesnt_contain_ab_cd_pq_xy?("ab")
# p it_doesnt_contain_ab_cd_pq_xy?("acdb")

def is_string_nice?(input_string)
  it_contains_at_least_3_vowels(input_string) &&
  at_least_one_letter_twice_in_a_row(input_string) &&
  it_doesnt_contain_ab_cd_pq_xy?(input_string)
end
