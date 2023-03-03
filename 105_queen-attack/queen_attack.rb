class Queens
  def initialize(white: nil, black: nil)
    raise ArgumentError if white.is_a?(Array) && out_of_range?(white)
    raise ArgumentError if black.is_a?(Array) && out_of_range?(black)

    @white = white
    @black = black
  end

  def attack? = same_column? || same_row? || match_diagonal?

  private

  attr_reader :white, :black

  def out_of_range?(ary)
    ary[0].to_i.negative? || ary[0].to_i > 7 || ary[1].to_i.negative? || ary[1].to_i > 7
  end

  def same_column? = white[0] == black[0]

  def same_row? = white[1] == black[1]

  def match_diagonal? = (white[0] - black[0]).abs == (white[1] - black[1]).abs
end
