module BaseConverter
  def convert(input_base, digits, output_base)
    raise ArgumentError if output_base < 2 || input_base < 2
    raise ArgumentError if !digits || (digits.any? && (digits.min < 0 || digits.max >= input_base))

    result = digits.reverse.each_with_index.inject(0) do |sum, (value, index)|
      sum + value * input_base.pow(index)
    end
    output_digits = []
    loop do
      output_digits.unshift(result % output_base)
      result /= output_base
      break if result.zero?
    end
    output_digits
  end

  module_function :convert
end
