class Affine
  A_VALUE = 'a'.ord.freeze

  def initialize(a, b)
    @a = a
    @b = b
    @m = 26
    raise ArgumentError if (divs(a) & divs(m)).any?
  end

  def encode(message)
    data = message.downcase.strip.delete(' ,.')
    result = data.chars.each_with_object('') { |char, result| result << cipher(char) }
    result.scan(/.{1,5}/).join(' ')
  end

  def decode(data)
    index = (1..).find { ((1 + m * (1 + _1)) % a).zero? }
    @mmi = (1 + m * (1 + index)) / a
    data.split.join.chars.each_with_object('') { |char, result| result << decipher(char) }
  end

  private

  attr_reader :a, :b, :m, :mmi

  def divs(n) = (2.upto(n / 2).select { (n % _1).zero? }) << n

  def cipher(char)
    /[a-z]/.match?(char) ? ((a * (char.ord - A_VALUE) + b) % m + A_VALUE).chr : char
  end

  def decipher(char)
    /[a-z]/.match?(char) ? (((mmi * ((char.ord - A_VALUE) - b)) % m) + A_VALUE).chr : char
  end
end
