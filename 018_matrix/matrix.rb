class Matrix
  attr_reader :matrix

  def initialize(numbers)
    @matrix = numbers.split("\n").map { |row| row.split.map(&:to_i) }
  end

  def columns
    rows.transpose
  end

  alias rows matrix
end
