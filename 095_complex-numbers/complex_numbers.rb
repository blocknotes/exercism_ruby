class ComplexNumber
  attr_reader :a, :b

  alias real a
  alias imaginary b

  def initialize(a, b = 0)
    @a = a
    @b = b
  end

  def ==(other) = other.is_a?(ComplexNumber) ? a == other.a && b == other.b : false

  def +(other) = ComplexNumber.new(a + other.a, b + other.b)

  def -(other) = ComplexNumber.new(a - other.a, b - other.b)

  def *(other) = ComplexNumber.new(a * other.a - b * other.b, b * other.a + a * other.b)

  def /(other)
    res_a = (a * other.a + b * other.b) / (other.a.pow(2) + other.b.pow(2)).to_f
    res_b = (b * other.a - a * other.b) / (other.a.pow(2) + other.b.pow(2)).to_f
    ComplexNumber.new(res_a, res_b)
  end

  def abs = Math.sqrt(a.pow(2) + b.pow(2))

  def conjugate = ComplexNumber.new(a, -b)

  def exp
    res_a = ((Math::E ** a) * Math::cos(b)).round(15)
    res_b = ((Math::E ** a) * Math::sin(b)).round(15)
    ComplexNumber.new(res_a, res_b)
  end
end
