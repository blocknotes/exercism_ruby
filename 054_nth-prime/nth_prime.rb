module Prime
  module_function

  def nth(count)
    raise ArgumentError if count < 1

    result = 1
    while count.positive?
      result += 1
      count -= 1 if prime?(result)
    end
    result
  end

  def prime?(number)
    return false if number <= 1

    i = 2
    while i * i <= number
      return false if (number % i).zero?

      i += 1
    end
    true
  end
end
