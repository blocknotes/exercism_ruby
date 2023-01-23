class ResistorColorTrio
  VALUES = {
    'black' => 0,
    'brown' => 1,
    'red' => 2,
    'orange' => 3,
    'yellow' => 4,
    'green' => 5,
    'blue' => 6,
    'violet' => 7,
    'grey' => 8,
    'white' => 9
  }.freeze

  def initialize(ary)
    value1, value2, value3 = VALUES[ary[0]], VALUES[ary[1]], VALUES[ary[2]]
    raise ArgumentError if !value1 || !value2 || !value3

    @resistance = (value1 * 10 + value2) * 10.pow(value3)
  end

  def label
    value_label = resistance < 1000 ? "#{resistance} ohms" : "#{resistance / 1000} kiloohms"
    "Resistor value: #{value_label}"
  end

  private

  attr_reader :resistance
end
