require "md5"

describe "Day 04" do
  context "Part 01 - what is the lowest positive number (no leading zeroes: 1, 2, 3, ...) that produces such a hash?" do
    it "for abcdef hash 2nd part is 609043" do
      expect(md5_to_match("abcdef")).to eq("609043")
    end

    it "for pqrstuv hash 2nd part is 1048970" do
      expect(md5_to_match("pqrstuv")).to eq("1048970")
    end
  end
end
