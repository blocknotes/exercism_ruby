module Diamond
  def make_diamond(letter)
    size = letter.ord - 'A'.ord + 1
    result = Array.new(size * 2 - 1) { ' ' * (size * 2 - 1) }
    ('A'..letter).each_with_index do |char, row|
      result[row][size - 1 - row] = char
      result[row][size - 1 + row] = char
      result[(size - 1) * 2 - row][size - 1 - row] = char
      result[(size - 1) * 2 - row][size - 1 + row] = char
    end
    (result << '').join("\n")
  end

  module_function :make_diamond
end
