module RunLengthEncoding
  module_function

  def encode(message)
    prev = 0
    last = nil
    result = Hash.new(0)
    message.chars.each_with_index do |char, index|
      if last != char
        prev = index
        last = char
      end
      result[[last, prev]] += 1
    end
    result.map { |(char, _index), count| [count > 1 ? count : nil, char] }.join
  end

  def decode(data)
    data.scan(/([0-9]*)([a-zA-Z ])/).map { |n, char| char * (n == '' ? 1 : n.to_i) }.join
  end
end
