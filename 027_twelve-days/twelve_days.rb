class TwelveDays
  INTRO = "On the %s day of Christmas my true love gave to me: %s.\n".freeze
  DAYS = %w[first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth].freeze
  SENTENCES = [
    'a Partridge in a Pear Tree',
    'two Turtle Doves',
    'three French Hens',
    'four Calling Birds',
    'five Gold Rings',
    'six Geese-a-Laying',
    'seven Swans-a-Swimming',
    'eight Maids-a-Milking',
    'nine Ladies Dancing',
    'ten Lords-a-Leaping',
    'eleven Pipers Piping',
    'twelve Drummers Drumming'
  ].freeze

  def self.song
    song = DAYS.each_with_index.inject([]) do |result, (day, index)|
      part2 = index.positive? ? "#{SENTENCES.reverse[-index - 1..-2].join(', ')}, and " : ''
      part2 << SENTENCES[0]
      result << format(INTRO, day, part2)
    end
    song.join("\n")
  end
end
