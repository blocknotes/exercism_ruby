module Change
  class ImpossibleCombinationError < StandardError; end
  class NegativeTargetError < StandardError; end

  def generate(coins, value)
    return [] if value.zero?
    raise NegativeTargetError if value.negative?
    raise ImpossibleCombinationError if value != 0 && value < coins.min

    eval_coins(coins, value) || raise(ImpossibleCombinationError)
  end

  def eval_coins(coins, value)
    map = coins.sort.each_with_object([]) { |coin, result| result[coin] = [coin] }
    1.upto(value).reject { map[_1] }.each do |i|
      (i - 1).downto(1).each do |j|
        next if !map[j] || !map[i - j]

        new_combo = map[j] + map[i - j]
        map[i] = new_combo if !map[i] || map[i].size > new_combo.size
      end
    end
    map[value]&.sort
  end

  module_function :generate, :eval_coins
end
