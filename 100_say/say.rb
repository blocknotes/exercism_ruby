class Say
  TRILLION = 1_000_000_000_000
  BILLION  = 1_000_000_000
  MILLION  = 1_000_000
  THOUSAND = 1_000

  NUMBERS = {
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve',
    13 => 'thirteen',
    14 => 'fourteen',
    15 => 'fifteen',
    16 => 'sixteen',
    17 => 'seventeen',
    18 => 'eighteen',
    19 => 'nineteen',
    20 => 'twenty',
    30 => 'thirty',
    40 => 'forty',
    50 => 'fifty',
    60 => 'sixty',
    70 => 'seventy',
    80 => 'eighty',
    90 => 'ninety'
  }.freeze

  def initialize(number) = @number = number

  def in_english
    raise ArgumentError if number.negative? || number >= TRILLION

    return 'zero' if number.zero?

    NUMBERS[number] || composite_number(number)
  end

  private

  attr_reader :number

  def composite_number(number)
    result = [
      above_thousand(number, BILLION, 'billion'),
      above_thousand(number, MILLION, 'million'),
      above_thousand(number, THOUSAND, 'thousand'),
      (number % THOUSAND).positive? ? below_thousand(number) : nil
    ]
    result.compact.join(' ')
  end

  def above_thousand(num, limit, append)
    partial = num / limit
    below_thousand(partial % limit, append: append) if (partial % 10).positive?
  end

  def below_thousand(num, append: nil)
    result = []

    hundreds = (num / 100) % 10
    result << "#{NUMBERS[hundreds]} hundred" if hundreds.positive?

    tens = num % 100
    base = (tens / 10) * 10
    result << [NUMBERS[base], NUMBERS[tens - base]].compact.join('-') if tens.positive?

    result << append if append

    result
  end
end
