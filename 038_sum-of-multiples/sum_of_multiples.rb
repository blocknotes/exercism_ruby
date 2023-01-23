require 'set'

class SumOfMultiples
  def initialize(*numbers)
    @numbers = *numbers
  end

  def to(ref)
    multiples = (1...ref).each_with_object(Set.new) do |i, result|
      numbers.each do |n|
        m = n * i
        result << m if m < ref
      end
    end
    multiples.sum
  end

  private

  attr_reader :numbers
end
