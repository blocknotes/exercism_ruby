module CollatzConjecture
  module_function

  def steps(number, step = 0)
    raise ArgumentError unless number.positive?
    return step if number == 1

    number.even? ? steps(number / 2, step + 1) : steps(number * 3 + 1, step + 1)
  end
end
