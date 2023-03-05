class Microwave
  attr_reader :timer

  def initialize(value)
    seconds = (value % 100)
    @timer = format('%02d:%02d', value / 100 + seconds / 60, seconds % 60)
  end
end
