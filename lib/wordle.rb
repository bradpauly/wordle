class Wordle
  def initialize(answer)
    @answer = answer.to_s.upcase
  end

  def guess(word)
    word.to_s.upcase == @answer
  end
end
