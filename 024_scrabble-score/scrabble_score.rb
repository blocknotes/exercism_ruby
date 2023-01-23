class Scrabble
  POINTS = {
    'AEIOULNRST' => 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
  }.freeze

  def initialize(word)
    @word = word || ''
  end

  def score
    word.upcase.chars.inject(0) { |result, char| result + points_for(char) }
  end

  private

  attr_reader :word

  def points_for(letter)
    POINTS.each do |letters, value|
      return value if letters.include?(letter)
    end
    0
  end
end
