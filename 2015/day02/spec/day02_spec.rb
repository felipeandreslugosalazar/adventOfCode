require "wrapping_paper_to_order"

describe "Day 02" do
  context "Part 01 - How many wrapping paper should they order ?" do
    it "A present with dimensions 2x3x4 needs 58 square feet" do
      expect(wrapping_paper_to_order_individual("2x3x4")).to eq(58)
    end

    it "A present with dimensions 1x1x10 needs 43 square feet" do
      expect(wrapping_paper_to_order_individual("1x1x10")).to eq(43)
    end
  end
end
