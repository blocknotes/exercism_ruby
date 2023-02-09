class Cipher
  A_VALUE = 'a'.ord
  LETTERS = ('a'..'z').to_a

  attr_reader :key, :key_values

  def initialize(input_key = nil)
    raise ArgumentError if input_key && !/[a-z]+/.match(input_key)

    @key = input_key || 'a' * 100
    @key_values = key.chars.map(&:ord)
  end

  def encode(message)
    translate(message.chars.map.with_index { |v, i| ((v.ord + key_values[i].to_i) % A_VALUE) % 26 })
  end

  def decode(data)
    translate(data.chars.map.with_index { |v, i| (v.ord - key_values[i].to_i) % 26 })
  end

  private

  def translate(values) = values.map { LETTERS[_1] }.join
end
