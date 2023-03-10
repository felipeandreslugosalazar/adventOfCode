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
end
