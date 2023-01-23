class Luhn
  def self.valid?(string)
    clean_string = (string || '').delete(' ')
    return false if clean_string.size < 2 || clean_string =~ /[^\d]/

    mod = clean_string.size % 2
    mod2 = (mod + 1) % 2
    digits = clean_string.chars.map(&:to_i)
    result = digits.each_slice(2).map { (_1[mod] == 9 ? 9 : (_1[mod].to_i * 2) % 9) + _1[mod2] }.sum
    (result % 10).zero?
  end
end
