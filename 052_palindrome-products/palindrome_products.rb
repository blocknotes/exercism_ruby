class Palindromes
  Value = Struct.new(:value, :factors)

  def initialize(max_factor:, min_factor: 1)
    @max_factor = max_factor
    @min_factor = min_factor
  end

  def generate
    products = []
    min_factor.upto(max_factor).each do |i|
      min_factor.upto(max_factor).each do |j|
        products << [i, j, i * j]
      end
    end
    @results = products.select { |_i, _j, product| palindrome?(product) }
  end

  def smallest
    min = results.min { |a, b| a[2] <=> b[2] }[2]
    factors = results.select { |i, j, product| product == min && i <= j }.map { [_1, _2] }
    Value.new(min, factors)
  end

  def largest
    max = results.max { |a, b| a[2] <=> b[2] }[2]
    factors = results.select { |i, j, product| product == max && i <= j }.map { [_1, _2] }
    Value.new(max, factors)
  end

  private

  attr_reader :max_factor, :min_factor, :results

  def palindrome?(value) = value.to_s == value.to_s.reverse
end
