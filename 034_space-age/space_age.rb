class SpaceAge
  SECONDS_PER_YEAR = 3600 * 24 * 365.256366

  MERCURY_ORBITAL_PERIOD = 0.2408467
  VENUS_ORBITAL_PERIOD = 0.61519726
  MARS_ORBITAL_PERIOD = 1.8808158
  JUPITER_ORBITAL_PERIOD = 11.862615
  SATURN_ORBITAL_PERIOD = 29.447498
  URANUS_ORBITAL_PERIOD = 84.016846
  NEPTUNE_ORBITAL_PERIOD = 164.79132

  def initialize(seconds) = @seconds = seconds

  def on_earth = (seconds / SECONDS_PER_YEAR).round(2)

  def on_mercury = (seconds / SECONDS_PER_YEAR / MERCURY_ORBITAL_PERIOD).round(2)

  def on_venus = (seconds / SECONDS_PER_YEAR / VENUS_ORBITAL_PERIOD).round(2)

  def on_mars = (seconds / SECONDS_PER_YEAR / MARS_ORBITAL_PERIOD).round(2)

  def on_jupiter = (seconds / SECONDS_PER_YEAR / JUPITER_ORBITAL_PERIOD).round(2)

  def on_saturn = (seconds / SECONDS_PER_YEAR / SATURN_ORBITAL_PERIOD).round(2)

  def on_uranus = (seconds / SECONDS_PER_YEAR / URANUS_ORBITAL_PERIOD).round(2)

  def on_neptune = (seconds / SECONDS_PER_YEAR / NEPTUNE_ORBITAL_PERIOD).round(2)

  private

  attr_reader :seconds
end
