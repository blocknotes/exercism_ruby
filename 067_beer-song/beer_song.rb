module BeerSong
  SENTENCES = {
    nil => <<~MANY_BOTTLES,
      %<bottles1>d bottles of beer on the wall, %<bottles1>s bottles of beer.
      Take one down and pass it around, %<bottles2>s bottle%<pl>s of beer on the wall.
    MANY_BOTTLES
    1 => <<~ONE_BOTTLE,
      1 bottle of beer on the wall, 1 bottle of beer.
      Take it down and pass it around, no more bottles of beer on the wall.
    ONE_BOTTLE
    0 => <<~NO_MORE_BOTTLES
      No more bottles of beer on the wall, no more bottles of beer.
      Go to the store and buy some more, 99 bottles of beer on the wall.
    NO_MORE_BOTTLES
  }.freeze

  def recite(starting, steps)
    plural = ->(n) { n > 1 ? 's' : '' }
    sentences = starting.downto(starting - steps + 1).map do |i|
      i > 1 ? format(SENTENCES[nil], bottles1: i, bottles2: i - 1, pl: plural[i - 1]) : SENTENCES[i]
    end
    sentences.join("\n")
  end

  module_function :recite
end
