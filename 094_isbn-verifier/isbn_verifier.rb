module IsbnVerifier
  def valid?(string)
    chars = string.delete('-').chars.reverse
    return false if chars.size != 10 || !/\A[\d-]+X{0,1}\z/.match?(string)

    sum = chars.map.with_index.inject(0) do |result, (char, i)|
      result + (char == 'X' ? 10 : char.to_i) * (i + 1)
    end
    (sum % 11).zero?
  end

  module_function :valid?
end
