class Triangle
  def initialize(rows_count) = @rows_count = rows_count

  def rows
    @rows_count.times.each_with_object([]) do |i, result|
      line = Array.new(i + 1, 1)
      (1..i - 1).each do |j|
        line[j] = result[i - 1][j - 1] + result[i - 1][j]
      end
      result << line
    end
  end
end
