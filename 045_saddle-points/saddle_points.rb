class Matrix
  attr_reader :rows

  def initialize(data) = @rows = (data || '').split("\n").map(&:split).map(&method(:prepare_row))

  def saddle_points
    result = []
    cols = columns
    rows.each_with_index do |row, i|
      row.each_with_index do |value, j|
        result << [i, j] if saddle_point?(value, row: row, column: cols[j])
      end
    end
    result
  end

  def columns = rows.transpose

  private

  def prepare_row(row) = row.map(&:to_i)

  def saddle_point?(value, row:, column:) = value >= row.max && value <= column.min
end
