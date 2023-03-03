module FoodChain
  ANIMALS = %w[fly spider bird cat dog goat cow].freeze
  LAST_ANIMAL = 'horse'.freeze

  OPENING = 'I know an old lady who swallowed a %s.'.freeze
  CATCH = 'She swallowed the %s to catch the %s.'.freeze
  CLOSING = "I don't know why she swallowed the fly. Perhaps she'll die.".freeze
  ENDING = "She's dead, of course!\n".freeze

  ANIMAL_DESC = {
    'spider' => 'It wriggled and jiggled and tickled inside her.',
    'bird' => 'How absurd to swallow a bird!',
    'cat' => 'Imagine that, to swallow a cat!',
    'dog' => 'What a hog, to swallow a dog!',
    'goat' => 'Just opened her throat and swallowed a goat!',
    'cow' => "I don't know how she swallowed a cow!"
  }.freeze
  EXTRA_DESC = {
    'spider' => 'spider that wriggled and jiggled and tickled inside her'
  }.freeze

  def song
    result = []
    ANIMALS.each_with_index do |animal, index|
      lines = [format(OPENING, animal)]
      unless result.empty?
        lines << ANIMAL_DESC[animal]
        index.downto(1) do
          last_animal = ANIMALS[_1 - 1]
          lines << format(CATCH, ANIMALS[_1], EXTRA_DESC[last_animal] || last_animal)
        end
      end
      lines << CLOSING
      result << lines.join("\n")
    end
    result << [format(OPENING, LAST_ANIMAL), ENDING].join("\n")
    result.join("\n\n")
  end

  module_function :song
end
