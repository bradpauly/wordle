require "minitest/autorun"
require "./lib/wordle"

describe Wordle do
  describe "#guess" do
    it "returns an array with misses, matches, and hits" do
      wordle = Wordle.new("train")

      assert_equal [2, 0, 1, 1, 0], wordle.guess("think")
    end

    it "returns an array of hits" do
      wordle = Wordle.new("tests")

      assert_equal [2, 2, 2, 2, 2], wordle.guess("tests")
    end

    it "is case insensitive" do
      wordle = Wordle.new("tests")

      assert_equal [2, 2, 2, 2, 2], wordle.guess("TEsts")
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

  it "handles duplicates correctly" do
    wordle = Wordle.new("tests")

    assert_equal [2, 2, 2, 1, 1], wordle.guess("tesst")
  end
end
