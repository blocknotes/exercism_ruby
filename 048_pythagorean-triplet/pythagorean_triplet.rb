class Triplet
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a, @b, @c = [a, b, c].sort
  end

  def product = a * b * c

  def pythagorean? = a.pow(2) + b.pow(2) == c.pow(2)

  def sum = a + b + c

  def self.where(max_factor:, min_factor: 1, sum: nil)
    numbers = min_factor.upto(max_factor).to_a
    (2...numbers.size).each_with_object([]) do |j, results|
      triplets = []
      numbers[0...j].each_with_index do |number, i|
        result = search_triplet(number, numbers[j], numbers[i...j])
        next unless result
        next if sum && result.sum != sum

        triplets << result
      end
      results.concat(triplets) if triplets.any?
    end
  end

  def self.search_triplet(a, c, numbers)
    numbers.each do |b|
      if a * a + b * b >= c * c
        triplet = Triplet.new(a, b, c)
        return triplet.pythagorean? ? triplet : nil
      end
    end
    nil
  end
end
