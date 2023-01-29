class Alphametics
  def initialize(input)
    @words = input.scan(/[A-Z]+/)
    @last_column = words.map(&:size).max
    @first_result_letter = words.last[0]
    @solution = {}
  end

  def solve
    return {} if result_word_too_short?

    process_column(column: 1)
    solution
  end

  class << self
    def solve(input) = new(input).solve
  end

  private

  attr_reader :first_result_letter, :last_column, :solution, :words

  def result_word_too_short? = words.last.size < last_column

  def process_column(column:, mapping: {}, remain: 0)
    return (@solution = mapping) if column > last_column

    column_letters = words.filter_map { _1[-column] }
    uniq_letters = (column_letters - mapping.keys).uniq
    ((0..9).to_a - mapping.values).permutation(uniq_letters.size).each do |sequence|
      mapping2 = mapping.merge(uniq_letters.zip(sequence).to_h)
      sum = remain + column_letters[..-2].inject(0) { |result, letter| result + mapping2[letter] }
      next if mapping2[first_result_letter]&.zero? || sum % 10 != mapping2[column_letters.last]

      process_column(column: column + 1, mapping: mapping2, remain: sum / 10)
    end
  end
end
