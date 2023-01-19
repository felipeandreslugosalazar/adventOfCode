require "where_should_santa_go"
require "at_what_step_goes_santa_to_the_basement"

describe "Day 01" do
  context "Part 01 - where should santa go ?" do
    it "(()) and ()() take Santa to floor 0" do
      expect(where_should_santa_go("(())")).to eq(0)
      expect(where_should_santa_go("()()")).to eq(0)
    end

    it "((( and (()(()( and ))((((( take Santa to floor 3" do
      expect(where_should_santa_go("(((")).to eq(3)
      expect(where_should_santa_go("(()(()(")).to eq(3)
      expect(where_should_santa_go("))(((((")).to eq(3)
    end

    it "()) and ))( take Santa to floor -1 (the first basement level)" do
      expect(where_should_santa_go("())")).to eq(-1)
      expect(where_should_santa_go("))(")).to eq(-1)
    end

    it "))) and )())()) take Santa to floor -3" do
      expect(where_should_santa_go(")))")).to eq(-3)
      expect(where_should_santa_go(")())())")).to eq(-3)
    end
  end

  context "Part 02 - At what step goes santa to the basement ?" do
    it ") causes Santa to enter the basement at character position 1" do
      expect(position_of_the_character(")")).to eq(1)
    end

    it "()()) causes him to enter the basement at character position 5" do
      expect(position_of_the_character("()())")).to eq(5)
    end
  end
end
