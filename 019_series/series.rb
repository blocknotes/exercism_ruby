class Series
  def initialize(sequence)
    @sequence = sequence || ''
  end

  def slices(size)
    raise ArgumentError if size <= 0 || size > sequence.size

    size.upto(sequence.size).map do |i|
      sequence[i - size...i]
    end
  end

  private

  attr_reader :sequence
end
