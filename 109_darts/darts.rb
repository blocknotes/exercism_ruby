class Darts
  OUTER_CIRCLE = (5..10)
  MIDDLE_CIRCLE = (1..5)
  INNER_CIRCLE = (0..1)

  def initialize(x, y) = @position = Math.sqrt(x * x + y * y)

  def score
    case position
    when INNER_CIRCLE then 10
    when MIDDLE_CIRCLE then 5
    when OUTER_CIRCLE then 1
    else 0
    end
  end

  private

  attr_reader :position
end
