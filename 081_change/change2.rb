class Change
  class ImpossibleCombinationError < StandardError; end

  class NegativeTargetError < StandardError; end

  def generate(coins, value)
    raise NegativeTargetError if value.negative?
    raise ImpossibleCombinationError if value != 0 && value < coins.min
    return [] if value.zero?

    dp = Array.new(value+1, value+1)
    dp[0] = 0

    coins.each do |coin|
      (coin..value).each do |j|
        dp[j] = [dp[j], dp[j-coin]+1].min
      end
    end

    return [] if dp[value] == value+1

    result = []
    i = value
    while i > 0 do
      coins.each do |coin|
        if i >= coin && dp[i] == dp[i-coin]+1
          result << coin
          i -= coin
          break
        end
      end
    end
    # raise ImpossibleCombinationError if result.empty?

    result
  end

  class << self
    def generate(coins, value) = Change.new.generate(coins, value)
  end
end
