class Pangram
  def self.pangram?(sentence)
    sentence.downcase.gsub(/[^a-z]/, '').chars.uniq.size == 26
  end
end
