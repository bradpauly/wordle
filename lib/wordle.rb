class Wordle
  def initialize(answer)
    @answer = answer.to_s.upcase.split(//)
  end

  def guess(word)
    letters = word.to_s.upcase.split(//)
    letters.map do |letter|
      if @answer.include?(letter)
        @answer.index(letter) == letters.index(letter) ? 2 : 1
      else
        0
      end
    end
  end
end
