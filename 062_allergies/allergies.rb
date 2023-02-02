class Allergies
  VALUES = {
    128 => 'cats',
    64 => 'pollen',
    32 => 'chocolate',
    16 => 'tomatoes',
    8 => 'strawberries',
    4 => 'shellfish',
    2 => 'peanuts',
    1 => 'eggs'
  }

  def initialize(value) = @value = value

  def allergic_to?(allergen) = list.include?(allergen)

  def list
    result = []
    return result unless @value.positive?

    v = @value
    loop do
      allergen_value = 2.pow(Math.log(v, 2).to_i)
      v -= allergen_value
      result << VALUES[allergen_value] if VALUES.key?(allergen_value)
      break if v < 1
    end
    result.reverse
  end
end
