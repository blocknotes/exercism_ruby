module ArmstrongNumbers
  module_function

  def include?(number)
    digits = number.to_s.chars.map(&:to_i)
    size = digits.size
    result = digits.inject(0) { |result, digit| result + digit.pow(size) }
    number == result
  end
end
