class Wordle
  def initialize(answer)
    @answer = answer.to_s.upcase.split(//)
  end

  def guess(word)
    letters = word.to_s.upcase.split(//)
    letters.each_with_index.map do |letter, i|
      if @answer.include?(letter)
        @answer[i] == letters[i] ? 2 : 1
      else
        0
      end
    end
  end
end
