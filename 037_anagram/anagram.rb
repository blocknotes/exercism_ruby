class Anagram
  def initialize(word)
    @word_downcase = word.downcase
    @word_chars = word.downcase.chars.sort
  end

  def match(words) = words.select { anagram?(_1.downcase) }

  private

  attr_reader :word_chars, :word_downcase

  def anagram?(word) = word != word_downcase && word.chars.sort == word_chars
end
