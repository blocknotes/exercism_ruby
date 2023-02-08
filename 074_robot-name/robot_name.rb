class Robot
  LETTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.freeze

  attr_reader :name

  def initialize
    @@count ||= 0
    reset
  end

  def reset
    @@count += 1
    id = @@count % 676000
    ab = id / 1000
    a = LETTERS[25 - ab % 26]
    b = LETTERS[ab / 26]
    @name = format('%c%c%03d', a, b, (2997 - ((id % 1000) * 3)) % 1000)
  end

  def self.forget = @@count = 0
end
