module Grains
  module_function

  def square(number)
    raise ArgumentError if number <= 0 || number > 64

    2.pow(number - 1)
  end

  def total = square(64) * 2 - 1
end
