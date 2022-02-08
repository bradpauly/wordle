require "set"

class Wordle
  class MaxGuessesExceeded < StandardError; end
  class InvalidGuess < StandardError; end

  def initialize(answer)
    @answer = answer.to_s.upcase.split(//)
    @guesses = []
    @hits = Set.new
    @matches = Set.new
    @misses = Set.new
  end

  def guess(word)
    raise InvalidGuess, "Invalid guess" if word.size != 5

    @guesses << word
    raise MaxGuessesExceeded, "Out of guesses" if @guesses.size > 6

    letters = word.to_s.upcase.split(//)
    letters.each_with_index.map do |letter, i|
      if @answer.include?(letter)
        if @answer[i] == letters[i]
          @hits << letter
          2
        else
          @matches << letter
          1
        end
      else
        @misses << letter
        0
      end
    end
  end

  def hits
    @hits.sort
  end

  def matches
    @matches.sort
  end

  def misses
    @misses.sort
  end
end
