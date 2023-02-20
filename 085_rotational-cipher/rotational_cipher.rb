module RotationalCipher
  def rotate(message, key)
    source = ('a'..'z').to_a + ('A'..'Z').to_a
    dest = source[key...26] + source[0...key] + source[26 + key...52] + source[26...26 + key]
    mapping = dest.map.with_index { |c, i| [source[i], c] }.to_h
    message.chars.map { mapping[_1] || _1 }.join
  end

  module_function :rotate
end
