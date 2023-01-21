require "houses_with_at_least_one_present"

describe "Day 03" do
  context "Part 01 - How many houses receive at least one present ?" do
    it "> delivers presents to 2 houses" do
      expect(houses_with_at_least_one_present(">")).to eq(2)
    end

    it "^>v< delivers presents to 4 houses" do
      expect(houses_with_at_least_one_present("^>v<")).to eq(4)
    end

    it "^v^v^v^v^v delivers a bunch of presents to some very lucky children at only 2 houses" do
      expect(houses_with_at_least_one_present("^v^v^v^v^v")).to eq(2)
    end
  end
end
