require 'date'

class Meetup
  WDAYS = %i[monday tuesday wednesday thursday friday saturday sunday].freeze
  START_DAY = { first: 1, second: 8, third: 15, fourth: 22, teenth: 13 }.freeze

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(day, descriptor)
    target = WDAYS.index(day) + 1
    case descriptor
    when :first, :second, :third, :fourth, :teenth
      start_day = Date.new(year, month, START_DAY[descriptor])
      start_day + (target - start_day.cwday) % 7
    when :last
      last = Date.new(year, month, 1).next_month - 1
      last -= 7 if target > last.cwday
      last + (target - last.cwday)
    end
  end

  private

  attr_reader :month, :year
end
