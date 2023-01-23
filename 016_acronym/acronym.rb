class Acronym
  def self.abbreviate(string)
    clean_string = string.tr('-', ' ').gsub(/[^\w\s]/, '').strip
    clean_string.split.map { _1[0] }.join.upcase
  end
end
