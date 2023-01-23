class Proverb
  REPEATING_LINE = 'For want of a %s the %s was lost.'.freeze
  CLOSING_LINE = 'And all for the want of a %s.'.freeze

  def initialize(*words, qualifier: nil)
    @sentences = words.each_with_object([]) do |word, result|
      result << format(REPEATING_LINE, last_word, word) if last_word
      @last_word = word
    end
    sentences << format(CLOSING_LINE, [qualifier, words.first].compact.join(' '))
  end

  def to_s = sentences.join("\n")

  private

  attr_reader :last_word, :sentences
end
