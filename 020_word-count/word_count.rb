class Phrase
  def initialize(sentence)
    @sentence = sentence || ''
  end

  def word_count
    sentence.downcase.scan(/\b[\w']+\b/).tally
  end

  private

  attr_reader :sentence
end
