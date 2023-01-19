require "wrapping_paper_to_order"
require "total_feet_of_ribbon"

describe "Day 02" do
  context "Part 01 - How many wrapping paper should they order ?" do
    it "A present with dimensions 2x3x4 needs 58 square feet" do
      expect(wrapping_paper_to_order_individual("2x3x4")).to eq(58)
    end

    it "A present with dimensions 1x1x10 needs 43 square feet" do
      expect(wrapping_paper_to_order_individual("1x1x10")).to eq(43)
    end
  end

  context "Part 02 - How many ribbon should they order ?" do
    it "A present with dimensions 2x3x4 requires 34 feet." do
      expect(total_feet_of_ribbon_per_present("2x3x4")).to eq(34)
    end

    it "A present with dimensions 1x1x10 requires 14 feet." do
      expect(total_feet_of_ribbon_per_present("1x1x10")).to eq(14)
    end
  end
end
