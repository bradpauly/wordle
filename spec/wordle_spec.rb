require "minitest/autorun"
require "./lib/wordle"

describe Wordle do
  describe "#guess" do
    it "returns true when the given word matches" do
      wordle = Wordle.new("testing")

      assert wordle.guess("testing")
    end

    it "is case insensitive" do
      wordle = Wordle.new("testing")

      assert wordle.guess("TESting")
    end
  end
end
