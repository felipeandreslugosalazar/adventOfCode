require "helper"

describe "--- Day 8: Matchsticks ---" do
  context "For examples" do

    # "" is 2 characters of code (the two double quotes)
    # but the string contains zero characters.
    it "\"\" is 2 characters of code BUT the string contains 0 characters " do
      expect(numbers_of_characters_code("")).to eq(2)
      expect(numbers_of_characters_string ("")).to eq(0)
    end

    # # "abc" is 5 characters of code
    # # but 3 characters in the string data.
    it "\"abc\" is 5 characters of code BUT the string contains 3 characters " do
      expect(numbers_of_characters_code("abc")).to eq(5)
      expect(numbers_of_characters_string("abc")).to eq(3)
    end

    # # "aaa\"aaa" is 10 characters of code
    # # but the string itself contains 6 "a" characters and 1, escaped quote character, for a total of 7 characters in the string data.
    it "\"aaa\\\"aaa\" is 10 characters of code BUT the string contains 7 characters " do
      expect(numbers_of_characters_code("aaa\"aaa")).to eq(10)
      expect(numbers_of_characters_string("aaa\"aaa")).to eq(7)
    end

    # # # "'\x27'" is 6 characters of code, but the string itself contains just one - an apostrophe ('), escaped using hexadecimal notation.
    it "\"\x27\" is 6 characters of code BUT the string contains 1 character " do
      expect(numbers_of_characters_code("\x27")).to eq(6)
      expect(numbers_of_characters_string("\x27")).to eq(1)
    end
  end
end
