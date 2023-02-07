class Crypto
  def initialize(message) = @message = message

  def ciphertext
    normalized = message.downcase.gsub(/[^\w]/, '')
    rows, columns = rows_and_columns(normalized.size)
    normalized = normalized.ljust(rows * columns)
    return normalized if normalized.size <= 1

    normalized.chars.each_slice(columns).to_a.transpose.map(&:join).join(' ')
  end

  private

  attr_reader :message

  def rows_and_columns(size)
    sqrt = Math.sqrt(size)
    rows = sqrt.floor
    columns = sqrt.ceil
    rows += 1 if rows * columns < size
    [rows, columns]
  end
end
