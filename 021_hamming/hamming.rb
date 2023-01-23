class Hamming
  def self.compute(sequence1, sequence2)
    raise ArgumentError if sequence1.size != sequence2.size

    sequence1.chars.each_with_index.count { |char, index| char != sequence2[index] }
  end
end
