module RailFenceCipher
  module_function

  def encode(message, rails)
    return message if rails < 2

    cycle = rails * 2 - 2
    lines = Array.new(rails) { [] }
    message.each_char.with_index.each do |char, index|
      line = index % cycle
      lines[line < rails ? line : (cycle - line)] << char
    end
    lines.join
  end

  def decode(data, rails)
    return data if rails <= 1

    result = []
    cycle = rails * 2 - 2
    chars = data.chars
    rails.times do |rail|
      0.upto(data.size) do |i|
        pos1 = cycle * i + rail
        break if pos1 >= data.size
        result[pos1] = chars.shift

        pos2 = cycle * i + (cycle - rail) % cycle
        next if pos1 == pos2

        break if pos2 >= data.size
        result[pos2] = chars.shift
      end
    end
    result.join
  end
end
