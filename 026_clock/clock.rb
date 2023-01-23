class Clock
  attr_reader :total_minutes

  def initialize(hour: 0, minute: 0)
    @total_minutes = (hour * 60 + minute) % 1440
  end

  def to_s
    format('%<h>02i:%<m>02i', h: total_minutes / 60, m: total_minutes % 60)
  end

  def +(other)
    Clock.new(minute: total_minutes + other.total_minutes)
  end

  def -(other)
    Clock.new(minute: total_minutes - other.total_minutes)
  end

  def ==(other)
    total_minutes == other.total_minutes
  end
end
