Fixnum.class_eval do
  ROMAN_CONVERSION = {
    0 => '',
    1 => 'a',
    2 => 'aa',
    3 => 'aaa',
    4 => 'ab',
    5 => 'b',
    6 => 'ba',
    7 => 'baa',
    8 => 'baaa',
    9 => 'ac'
  }.freeze

  ROMAN_RANGES = {
    0 => { 'a' => 'I', 'b' => 'V', 'c' => 'X' },
    1 => { 'a' => 'X', 'b' => 'L', 'c' => 'C' },
    2 => { 'a' => 'C', 'b' => 'D', 'c' => 'M' },
    3 => { 'a' => 'M' }
  }.freeze

  def to_roman
    digits.each_with_index.each_with_object('') do |(digit, i), result|
      roman_digit = ROMAN_CONVERSION[digit].gsub(/./, ROMAN_RANGES[i])
      result.prepend(roman_digit)
    end
  end
end
