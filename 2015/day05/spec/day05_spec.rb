require "is_string_nice"

# Santa needs help figuring out which strings in his text file are naughty or nice.

describe "--- Day 5: Doesn't He Have Intern-Elves For This? ---" do
  context "Part 01 - How many strings are nice?" do
    # ugknbfddgicrmopn is nice because it has at least three vowels (u...i...o...), a double letter (...dd...), and none of the disallowed substrings.
    # aaa is nice because it has at least three vowels and a double letter, even though the letters used by different rules overlap.
    # jchzalrnumimnmhp is naughty because it has no double letter.
    # haegwjzuvuyypxyu is naughty because it contains the string xy.
    # dvszwmarrgswjxmb is naughty because it contains only one vowel.
    context "It contains at least three vowels (aeiou only)" do
      context "TRUE" do
        it "'aei' contains at least 3 vowels" do
          expect(it_contains_at_least_3_vowels("aei")).to be true
        end
        it "'xazegov' contains at least 3 vowels" do
          expect(it_contains_at_least_3_vowels("xazegov")).to be true
        end
        it "'aeiouaeiouaeiou' contains at least 3 vowels" do
          expect(it_contains_at_least_3_vowels("aeiouaeiouaeiou")).to be true
        end
      end
      context "FALSE" do
        it "'' does NOT contain at least 3 vowels" do
          expect(it_contains_at_least_3_vowels("")).to be false
        end
        it "'cvf' does NOT contain at least 3 vowels" do
          expect(it_contains_at_least_3_vowels("cvf")).to be false
        end
        it "'xazegv' does NOT contain at least 3 vowels" do
          expect(it_contains_at_least_3_vowels("xazegv")).to be false
        end
        it "'zxcvbzxcvbzxcvb' does NOT contain at least 3 vowels" do
          expect(it_contains_at_least_3_vowels("zxcvbzxcvbzxcvb")).to be false
        end
      end
    end

    context "It has at least one letter twice in a row" do
      context "TRUE" do
        it "'xx' has at least one letter twice in a row" do
          expect(at_least_one_letter_twice_in_a_row("xx")).to be true
        end
        it "'abcdde' has at least one letter twice in a row" do
          expect(at_least_one_letter_twice_in_a_row("abcdde")).to be true
        end
        it "'aabbccdd' has at least one letter twice in a row" do
          expect(at_least_one_letter_twice_in_a_row("aabbccdd")).to be true
        end
      end
      context "FALSE" do
        it "'xyx' has at least one letter twice in a row" do
          expect(at_least_one_letter_twice_in_a_row("xyx")).to be false
        end
        it "'abcdede' has at least one letter twice in a row" do
          expect(at_least_one_letter_twice_in_a_row("abcdede")).to be false
        end
        it "'arabsbctcdud' has at least one letter twice in a row" do
          expect(at_least_one_letter_twice_in_a_row("arabsbctcdud")).to be false
        end
      end
    end

    context "It does NOT contain any of this combinations ab|cd|pq|xy" do
      context "TRUE" do
        it "'dsndfhasjdmsklrhoqwf' does NOT contain any of this combinations ab|cd|pq|xy" do
          expect(it_doesnt_contain_ab_cd_pq_xy?("dsndfhasjdmsklrhoqwf")).to be true
        end
        it "'fasfasdfdesrfasdsgf' does NOT contain any of this combinations ab|cd|pq|xy" do
          expect(it_doesnt_contain_ab_cd_pq_xy?("fasfasdfdesrfasdsgf")).to be true
        end
        it "'haegwjzuvuyypu' does NOT contain any of this combinations ab|cd|pq|xy" do
          expect(it_doesnt_contain_ab_cd_pq_xy?("haegwjzuvuyypu")).to be true
        end
        it "'' does NOT contain any of this combinations ab|cd|pq|xy" do
          expect(it_doesnt_contain_ab_cd_pq_xy?("")).to be true
        end
      end
      context "FALSE" do
        it "'ab' does NOT contain any of this combinations ab|cd|pq|xy" do
          expect(it_doesnt_contain_ab_cd_pq_xy?("ab")).to be false
        end
        it "'cd' does NOT contain any of this combinations ab|cd|pq|xy" do
          expect(it_doesnt_contain_ab_cd_pq_xy?("cd")).to be false
        end
        it "'pq' does NOT contain any of this combinations ab|cd|pq|xy" do
          expect(it_doesnt_contain_ab_cd_pq_xy?("pq")).to be false
        end
        it "'xy' does NOT contain any of this combinations ab|cd|pq|xy" do
          expect(it_doesnt_contain_ab_cd_pq_xy?("xy")).to be false
        end
        it "'haegwjzuvuyypxyu' does NOT contain any of this combinations ab|cd|pq|xy" do
          expect(it_doesnt_contain_ab_cd_pq_xy?("haegwjzuvuyypxyu")).to be false
        end
      end
    end

    context "Which strings are nice or naughty ?" do
      it "'ugknbfddgicrmopn' is nice" do
        expect(is_string_nice?("ugknbfddgicrmopn")).to be true
      end
      it "'aaa' is nice" do
        expect(is_string_nice?("aaa")).to be true
      end
      it "'jchzalrnumimnmhp' is naughty" do
        expect(is_string_nice?("jchzalrnumimnmhp")).to be false
      end
      it "'haegwjzuvuyypxyu' is naughty" do
        expect(is_string_nice?("haegwjzuvuyypxyu")).to be false
      end
      it "'dvszwmarrgswjxmb' is naughty" do
        expect(is_string_nice?("dvszwmarrgswjxmb")).to be false
      end
    end
  end

  context "Part 02 - How many strings are nice? --- NEW RULZ ---" do
    context "It contains a pair of any two letters that appears at least twice in the string without overlapping" do
      context "TRUE" do
        # It contains a pair of any two letters that appears at least twice in the string without overlapping
        # TRUE
        it "'xyxy' contains a pair of any two letters ..." do
          # like xyxy (xy)
          expect(overlap_of_3?("xyxy")).to be false
          expect(it_contains_a_pair_of_any_two_letters_that_appears_at_least_twice?("xyxy")).to be true
        end
        it "'aabcdefgaa' contains a pair of any two letters ..." do
          # aabcdefgaa (aa)
          expect(overlap_of_3?("xyxy")).to be false
          expect(it_contains_a_pair_of_any_two_letters_that_appears_at_least_twice?("aabcdefgaa")).to be true
        end
      end
      context "FALSE" do
        # BUT not like aaa (aa, but it overlaps).
        it "'aaa' DOES contains a pair of any two letters ... BUT IT OVERLAPS" do
          # aabcdefgaa (aa)
          expect(overlap_of_3?("aaa")).to be true
          expect(it_contains_a_pair_of_any_two_letters_that_appears_at_least_twice?("aaa")).to be true
        end
      end
    end

    context "It contains at least one letter which repeats with exactly one letter between them" do
      context "TRUE" do
        it "'xyx' contains at least one letter which repeats with exactly one letter between them" do
          expect(it_contains_at_least_one_letter_which_repeats_with_exactly_one_letter_between_them?("xyx")).to be true
        end
        it "'abcdefeghi' contains at least one letter which repeats with exactly one letter between them" do
          expect(it_contains_at_least_one_letter_which_repeats_with_exactly_one_letter_between_them?("abcdefeghi")).to be true
        end
      end
      context "FALSE" do
        it "'xdyx' does NOT contains at least one letter which repeats with exactly one letter between them" do
          expect(it_contains_at_least_one_letter_which_repeats_with_exactly_one_letter_between_them?("xdyx")).to be false
        end
        it "'abcdeffeghi' does NOT contain at least one letter which repeats with exactly one letter between them" do
          expect(it_contains_at_least_one_letter_which_repeats_with_exactly_one_letter_between_them?("abcdeffeghi")).to be false
        end
      end
    end

    context "Which strings are nice or naughty ? --- NEW RULZ ---" do

      # qjhvhtzxzqqjkmpb is nice
      #   because is has a pair that appears twice (qj)
      #   and a letter that repeats with exactly one letter between them (zxz).
      it "'qjhvhtzxzqqjkmpb' is nice" do
        expect(is_string_nice_new_rulz?("qjhvhtzxzqqjkmpb")).to be true
      end

      # xxyxx is nice
      #   because it has a pair that appears twice
      #   and a letter that repeats with one between, even though the letters used by each rule overlap.
      it "'xxyxx' is nice" do
        expect(is_string_nice_new_rulz?("xxyxx")).to be true
      end

      # uurcxstgmygtbstg is naughty
      #   because it has a pair (tg)
      #   but no repeat with a single letter between them.
      it "'uurcxstgmygtbstg' is naughty" do
        expect(is_string_nice_new_rulz?("uurcxstgmygtbstg")).to be false
      end

      # ieodomkazucvgmuy is naughty
      #   because it has a repeating letter with one between (odo),
      #   but no pair that appears twice.
      it "'ieodomkazucvgmuy' is naughty" do
        expect(is_string_nice_new_rulz?("ieodomkazucvgmuy")).to be false
      end
    end
  end
end
