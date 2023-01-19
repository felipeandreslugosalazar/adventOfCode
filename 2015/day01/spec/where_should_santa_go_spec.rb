require "where_should_santa_go"

describe "Examples" do
  context "Part 01" do
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
end
