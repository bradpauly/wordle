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
  
    it "raises after 6 guesses" do
      wordle = Wordle.new("tests")
  
      6.times { wordle.guess("tesst") }
  
      assert_raises(Wordle::MaxGuessesExceeded) { wordle.guess("tesst") }
    end

    it "raises when words are less than 5 characters" do
      wordle = Wordle.new("tests")
  
      assert_raises(Wordle::InvalidGuess) { wordle.guess("tst") }
    end
  end

  describe "#hits" do
    it "retunrs the letters that are hits" do
      wordle = Wordle.new("tests")

      wordle.guess("testa")

      assert_equal wordle.hits, ["E", "S", "T"]
    end

    it "returns an empty set when there are no hits" do
      wordle = Wordle.new("flips")

      wordle.guess("treat")

      assert_equal wordle.hits, []
    end

    it "accumulates hits for guesses" do
      wordle = Wordle.new("flips")

      wordle.guess("feeee")
      wordle.guess("fleee")

      assert_equal wordle.hits, ["F", "L"]
    end
  end

  describe "#matches" do
    it "retunrs the letters that are matches" do
      wordle = Wordle.new("tests")

      wordle.guess("plant")

      assert_equal wordle.matches, ["T"]
    end

    it "returns an empty set when there are no matches" do
      wordle = Wordle.new("flips")

      wordle.guess("treat")

      assert_equal wordle.matches, []
    end

    it "accumulates matches for guesses" do
      wordle = Wordle.new("flips")

      wordle.guess("ieeee")
      wordle.guess("epeee")

      assert_equal wordle.matches, ["I", "P"]
    end
  end

  describe "#misses" do
    it "retunrs the letters that are misses" do
      wordle = Wordle.new("tests")

      wordle.guess("testa")

      assert_equal wordle.misses, ["A"]
    end

    it "returns an empty set when there are no misses" do
      wordle = Wordle.new("flips")

      wordle.guess("flips")

      assert_equal wordle.misses, []
    end

    it "accumulates misses for guesses" do
      wordle = Wordle.new("flips")

      wordle.guess("flipa")
      wordle.guess("flipe")

      assert_equal wordle.misses, ["A", "E"]
    end
  end
end
