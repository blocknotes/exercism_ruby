class ResistorColorDuo
  SCHEMA = {
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

  def self.value(colors)
    digit1 = SCHEMA[colors[0]]
    return digit1 unless colors[1]

    digit2 = SCHEMA[colors[1]]
    digit2 + digit1 * 10
  end
end
