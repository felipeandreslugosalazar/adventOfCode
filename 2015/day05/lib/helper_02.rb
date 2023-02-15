# *************************
# ******** PART 2. ********
# *************************

# Now, a nice string is one with all of the following properties:

# It contains a pair of any two letters that appears at least twice in the string without overlapping, like xyxy (xy) or aabcdefgaa (aa), but not like aaa (aa, but it overlaps).
def overlap_of_3?(string)
  # string.match?(/[a]{3,}|[b]{3,}|[c]{3,}|[d]{3,}|[e]{3,}|[f]{3,}|[g]{3,}|[h]{3,}|[i]{3,}|[j]{3,}|[k]{3,}|[l]{3,}|[m]{3,}|[n]{3,}|[o]{3,}|[p]{3,}|[q]{3,}|[r]{3,}|[s]{3,}|[t]{3,}|[u]{3,}|[v]{3,}|[w]{3,}|[x]{3,}|[y]{3,}|[z]{3,}/)
  char_hash = {}
  string.chars.each_cons(2) do |char|
    # p char
    if char_hash.key?(char)
      # p char_hash.key?(char)
      char_hash[char] += 1
    else
      char_hash[char] = 1
    end
  end
  p char_hash
end

overlap_of_3?("xyxy")
overlap_of_3?("aaa")

def it_contains_a_pair_of_any_two_letters_that_appears_at_least_twice?(string)
  # p string.chars.each_cons(2).tally.select { |k, v| v >= 2 }
  string.chars.each_cons(2).tally.any? { |k, v| v >= 2 }
end

# p it_contains_a_pair_of_any_two_letters_that_appears_at_least_twice?("")
# it_contains_a_pair_of_any_two_letters_that_appears_at_least_twice?("aabcdefgaa")
# p it_contains_a_pair_of_any_two_letters_that_appears_at_least_twice?("xyxy")

# It contains at least one letter
# which repeats with exactly one letter between them
#  like xyx, abcdefeghi (efe), or even aaa.

def it_contains_at_least_one_letter_which_repeats_with_exactly_one_letter_between_them?(string)
  # p string.chars.each_cons(3).any? { |a, b, c| a == c }
  string.chars.each_cons(3).any? { |a, b, c| a == c }
end

# p it_contains_at_least_one_letter_which_repeats_with_exactly_one_letter_between_them?("xyx")
# p it_contains_at_least_one_letter_which_repeats_with_exactly_one_letter_between_them?("abcdefeghi")
# p it_contains_at_least_one_letter_which_repeats_with_exactly_one_letter_between_them?("aaa")

# is_string_nice_new_rulz?

def is_string_nice_new_rulz?(new_rulz_string)
  # (if it_contains_at_least_one_letter_which_repeats_with_exactly_one_letter_between_them?(new_rulz_string) == true
  #   true
  # else
  #   false
  # end) && if (it_contains_a_pair_of_any_two_letters_that_appears_at_least_twice?(new_rulz_string) == true && !overlap_of_3?(new_rulz_string) == false)
  #   true
  # else
  #   false
  # end

  it_contains_at_least_one_letter_which_repeats_with_exactly_one_letter_between_them?(new_rulz_string) &&
    (it_contains_a_pair_of_any_two_letters_that_appears_at_least_twice?(new_rulz_string) &&
     !overlap_of_3?(new_rulz_string))
end

# p it_contains_at_least_one_letter_which_repeats_with_exactly_one_letter_between_them?("qjhvhtzxzqqjkmpb")
# p it_contains_a_pair_of_any_two_letters_that_appears_at_least_twice?("qjhvhtzxzqqjkmpb")

# p !overlap_of_3?("qjhvhtzxzqqjkmpb")
