class Isogram
  def self.isogram?(input)
    result = (input || '').downcase.chars.tally.select { _2 > 1 }.keys.join
    ['', ' ', '-', ' -', '- '].include?(result)
  end
end
