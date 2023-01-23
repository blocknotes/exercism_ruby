class AssemblyLine
  CARS_PER_HOUR = 221

  def initialize(speed)
    @speed = speed
    @success_rate = [0.0] + Array.new(4, 1.0) + Array.new(4, 0.9) + [0.8] + [0.77]
  end

  def production_rate_per_hour
    CARS_PER_HOUR * speed * success_rate[speed]
  end

  def working_items_per_minute
    (production_rate_per_hour / 60).to_i
  end

  private

  attr_reader :speed, :success_rate
end
