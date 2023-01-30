require "colorize"
# It contains at least three vowels (aeiou only)
# => aei, xazegov, or aeiouaeiouaeiou
def it_contains_at_least_3_vowels(string)
  string.match?(/[a-z]{3,}/)
end

# p it_contains_at_least_3_vowels("aei")
# p it_contains_at_least_3_vowels("xazegov")
# p it_contains_at_least_3_vowels("aeiouaeiouaeiou")

# It contains at least one letter that appears twice in a row
# => like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).

# we can split the string and check if the n-1 == n.
def at_least_one_letter_twice_in_a_row(string)
  array = string.split("")

  twice_in_a_row = false
  array.each.with_index do |char, i|
    if i > 0
      # puts "iteration #{i} || #{array[i - 1]} == #{array[i]} =>  #{array[i - 1] == array[i]}"
      if (array[i - 1] == array[i])
        twice_in_a_row = true
        break
      else
        twice_in_a_row
      end
    end
  end
  twice_in_a_row
end

# => like xx, abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
# p at_least_one_letter_twice_in_a_row("xx")
# p at_least_one_letter_twice_in_a_row("dd")
# p at_least_one_letter_twice_in_a_row("aabbccdd")
# p at_least_one_letter_twice_in_a_row("asdfghjk")
# p at_least_one_letter_twice_in_a_row("arabbccdd")

# It does not contain the strings 
# ab,
# cd,
# pq,
# xy,

#  even if they are part of one of the other requirements.

p  "ddddddddddalbdddddddddd".match?(/(ab|cd|pq|xy)/)
p  "ab".match?(/(ab|cd|pq|xy)/)
p  "acdb".match?(/(ab|cd|pq|xy)/)
