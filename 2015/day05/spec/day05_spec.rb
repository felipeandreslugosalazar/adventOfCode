require "is_string_nice"

# Santa needs help figuring out which strings in his text file are naughty or nice.

describe "--- Day 5: Doesn't He Have Intern-Elves For This? ---" do
  context "Part 01 -How many strings are nice?" do
    it "ugknbfddgicrmopn is nice" do
      expect(is_string_nice?("ugknbfddgicrmopn")).to be true
    end
    it "aaa is nice" do
      expect(is_string_nice?("aaa")).to be true
    end
    it "jchzalrnumimnmhp is nice" do
      expect(is_string_nice?("jchzalrnumimnmhp")).to be false
    end
    it "haegwjzuvuyypxyu is nice" do
      expect(is_string_nice?("haegwjzuvuyypxyu")).to be false
    end
    it "dvszwmarrgswjxmb is nice" do
      expect(is_string_nice?("dvszwmarrgswjxmb")).to be false
    end

    #
    # ugknbfddgicrmopn is nice because it has at least three vowels (u...i...o...), a double letter (...dd...), and none of the disallowed substrings.
    # aaa is nice because it has at least three vowels and a double letter, even though the letters used by different rules overlap.
    # jchzalrnumimnmhp is naughty because it has no double letter.
    # haegwjzuvuyypxyu is naughty because it contains the string xy.
    # dvszwmarrgswjxmb is naughty because it
  end
end
