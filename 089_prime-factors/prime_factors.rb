module PrimeFactors
  def of(n)
    m = n
    i = 2
    result = []
    loop do
      if (m % i).zero?
        result << i
        m /= i
      else
        i += 1
      end
      break if m <= 1
    end
    result
  end

  module_function :of
end
