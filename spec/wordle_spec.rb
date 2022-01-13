require "minitest/autorun"
require "./lib/wordle"

describe Wordle do
  describe "#guess" do
    it "returns an array of hits" do
      wordle = Wordle.new("tests")

      assert_equal [2, 2, 2, 2, 2], wordle.guess("tests")
    end

    it "is case insensitive" do
      wordle = Wordle.new("tests")

      assert_equal [2, 2, 2, 2, 2], wordle.guess("tests")
    end
  end

  it "returns an array of misses" do
    wordle = Wordle.new("tests")

    assert_equal [0, 0, 0, 0, 0], wordle.guess("abcda")
  end

  it "returns an array with matches" do
    wordle = Wordle.new("tests")

    assert_equal [0, 1, 0, 0, 0], wordle.guess("atcda")
  end

  it "returns an array with misses, matches, and hits" do
    wordle = Wordle.new("tests")

    assert_equal [2, 1, 0, 0, 0], wordle.guess("tsacd")
  end
end
