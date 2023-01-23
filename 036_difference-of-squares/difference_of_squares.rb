class Squares
  def initialize(number) = @number = number

  def square_of_sum = 1.upto(number).sum.pow(2)

  def sum_of_squares = 1.upto(number).map { _1.pow(2) }.sum

  def difference = square_of_sum - sum_of_squares

  private

  attr_reader :number
end
