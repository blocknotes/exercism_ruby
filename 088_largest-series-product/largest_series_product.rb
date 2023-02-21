class Series
  def initialize(sequence)
    raise ArgumentError unless /\A\d*\z/.match?(sequence)

    @sequence = sequence
  end

  def largest_product(size)
    raise ArgumentError if size.negative? || size > sequence.size
    return 1 if size.zero?

    numbers = sequence.chars.map(&:to_i)
    0.upto(numbers.size - size).map { |i| numbers[i...i + size].inject(&:*) }.max
  end

  private

  attr_reader :sequence
end
