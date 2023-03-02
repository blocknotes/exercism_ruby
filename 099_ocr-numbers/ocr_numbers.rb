module OcrNumbers
  module_function

  NUMBERS = [
    [' _ ', '| |', '|_|'], # 0
    ['   ', '  |', '  |'], # 1
    [' _ ', ' _|', '|_ '], # 2
    [' _ ', ' _|', ' _|'], # 3
    ['   ', '|_|', '  |'], # 4
    [' _ ', '|_ ', ' _|'], # 5
    [' _ ', '|_ ', '|_|'], # 6
    [' _ ', '  |', '  |'], # 7
    [' _ ', '|_|', '|_|'], # 8
    [' _ ', '|_|', ' _|']  # 9
  ].freeze

  def convert(input)
    lines = input.split("\n")
    raise ArgumentError if lines.size % 4 != 0 || lines.find { _1.size % 3 != 0 }

    lines.each_slice(4).map { convert_line(_1) }.join(',')
  end

  def convert_line(line)
    digits = line.map { _1.scan(/.{3}/) }.transpose
    digits.each_with_object('') do |digit, result|
      result << convert_digit(digit)
    end
  end

  def convert_digit(digit)
    NUMBERS.each_with_index do |number, value|
      return value.to_s if digit[0..2] == number
    end
    '?'
  end
end
