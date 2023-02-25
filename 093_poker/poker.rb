class Card
  VALUES = { 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14 }.freeze
  SUITS = { 'H' => 0, 'D' => 1, 'C' => 2, 'S' => 3 }.freeze

  attr_reader :suit, :value

  def initialize(value_suit)
    val = value_suit[0...-1]
    @value = VALUES[val] || val.to_i
    @suit = value_suit[-1]
  end

  def <=>(other)
    compare = other.value <=> value
    compare.zero? ? suit <=> other.suit : compare
  end
end

class Hand
  attr_reader :cards, :source, :weight

  def initialize(hand_cards)
    @source = hand_cards
    @cards = hand_cards.map { Card.new(_1) }.sort
  end

  def cards_values
    @cards_values ||= begin
      values = cards.map(&:value)
      straight_starting_with_ace = (values == [14, 5, 4, 3, 2])
      straight_starting_with_ace ? [5, 4, 3, 2, 1] : values
    end
  end

  def cards_suits = cards.map(&:suit)

  def calc_weight
    result = cards_values.tally.sort do |a, b|
      compare = b[1] <=> a[1]
      compare.zero? ? b[0] <=> a[0] : compare
    end
    values = result.reverse.map(&:first)
    @weight = values.map.with_index.inject(0) { |res, (value, i)| res + value * 15.pow(i) }
    self
  end

  def straight_flush? = flush? && straight?

  def four_of_a_kind? = cards_values.tally.any? { _2 == 4 }

  def full_house? = cards_values.uniq.size == 2

  def flush? = cards_suits.uniq.one?

  def straight? = !(1...cards.size).find { |i| cards_values[i - 1] != (cards_values[i] + 1) }

  def three_of_a_kind? = cards_values.tally.any? { _2 == 3 }

  def two_pairs? = cards_values.uniq.size == 3

  def one_pair? = cards_values.uniq.size == 4
end

class Poker
  RANKS = %i[
    straight_flush
    four_of_a_kind
    full_house
    flush
    straight
    three_of_a_kind
    two_pairs
    one_pair
  ].freeze

  def initialize(hands) = @hands = hands

  def best_hand
    return hands if hands.one?

    sorted_hands = hands.map { Hand.new(_1) }
    RANKS.each do |rank|
      results = sorted_hands.select { |hand| hand.send("#{rank}?") }.map(&:calc_weight)
      return [results.max_by(&:weight).source] if results.any?
    end
    highest_hands(sorted_hands)
  end

  private

  attr_reader :hands

  def highest_hands(sorted_hands)
    max = sorted_hands.map(&:calc_weight).map(&:weight).max
    sorted_hands.select { _1.weight == max }.map(&:source)
  end
end
