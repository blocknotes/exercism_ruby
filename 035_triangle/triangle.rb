class Triangle
  def initialize(sides)
    @sides = sides
  end

  def equilateral?
    triangle? && sides.uniq.size == 1
  end

  def isosceles?
    triangle? && sides.uniq.size < 3
  end

  def scalene?
    triangle? && sides.uniq.size == 3
  end

  def triangle?
    a, b, c = sides
    sides.all?(&:positive?) && (a + b) >= c && (b + c) >= a && (a + c) >= b
  end

  private

  attr_reader :sides
end
