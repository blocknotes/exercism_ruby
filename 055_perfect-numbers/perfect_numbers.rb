module PerfectNumber
  module_function

  def classify(number)
    raise RuntimeError if number.negative?

    factors = [1]
    2.upto(number / 2) do |i|
      factors << i if (number % i).zero?
    end
    sum = factors.sum

    return 'deficient' if sum < number
    return 'abundant' if sum > number

    'perfect'
  end
end
