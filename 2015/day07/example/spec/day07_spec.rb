require "some_assembly_required"

describe "Day 7: Some Assembly Required" do
  context "Part 01 - After running the circuit (123 -> x, 456 -> y, x AND y -> d, x OR y -> e, x LSHIFT 2 -> f, y RSHIFT 2 -> g, NOT x -> h, NOT y -> i), these are the final signals in the wires" do
    before(:all) do
      @test_instructions = "123 -> x
      456 -> y
      x AND y -> d
      x OR y -> e
      x LSHIFT 2 -> f
      y RSHIFT 2 -> g
      NOT x -> h
      NOT y -> i"

      @test_instructions = input_preparation(@test_instructions)

      @test_dic = {}
      ("a".."z").to_a.map { |e| @test_dic["#{e}"] = 0 }
      run_circuit(@test_instructions, @test_dic)
    end

    it "for d the final signal is 72" do
      expect(@test_dic["d"]).to eq(72)
    end
    it "for e the final signal is 507" do
      expect(@test_dic["e"]).to eq(507)
    end
    it "for f the final signal is 492" do
      expect(@test_dic["f"]).to eq(492)
    end
    it "for g the final signal is 114" do
      expect(@test_dic["g"]).to eq(114)
    end
    it "for h the final signal is 65412" do
      expect(@test_dic["h"]).to eq(65412)
    end
    it "for i the final signal is 65079" do
      expect(@test_dic["i"]).to eq(65079)
    end
    it "for x the final signal is 123" do
      expect(@test_dic["x"]).to eq(123)
    end
    it "for y the final signal is 456" do
      expect(@test_dic["y"]).to eq(456)
    end
  end
end
