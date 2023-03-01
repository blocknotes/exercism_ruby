module Validations
  def invalid_pins?(pins) = pins.negative? || pins > 10

  def strike_after_non_strike?(frame, pins) = (frame.sum % 10) + pins > 10

  def roll_if_game_already_has_ten_frames?(frame) = frame.size == 2 && frame.sum < 2

  def roll_after_bonus_rolls?(frame) = frame.size > 2

  def two_rolls_in_a_frame_cannot_score_more_than_10_points?(frame, pins) = (frame.sum + pins) > 10
end

class Game
  include Validations

  BowlingError = Class.new(StandardError)

  STRIKE = [10].freeze
  TOTAL_FRAMES = 10

  def initialize
    @score = 0
    @frame = 0
    @frames = Array.new(TOTAL_FRAMES) { [] }
    @spare = false
  end

  def roll(pins)
    raise BowlingError unless valid_roll?(pins)

    current_frame << pins
    remaining = 10 - current_frame.sum
    return unless can_advance?(remaining)

    update_score
    @spare = remaining.zero? && current_frame.size == 2
    @frame += 1
  end

  def score
    raise BowlingError unless frame == 9

    update_score_on_last_frame
    @score
  end

  private

  attr_reader :frame, :frames, :spare

  def current_frame = frames[frame]

  def previous_frame = frames[frame - 1]

  def previous_previous_frame = frames[frame - 2]

  def valid_roll?(pins)
    return false if invalid_pins?(pins)

    if frame == 9
      return false if strike_after_non_strike?(current_frame, pins) ||
                      roll_if_game_already_has_ten_frames?(current_frame) ||
                      roll_after_bonus_rolls?(current_frame)
    elsif two_rolls_in_a_frame_cannot_score_more_than_10_points?(current_frame, pins)
      return false
    end
    true
  end

  def can_advance?(remaining) = (remaining.zero? || current_frame.size == 2) && frame < 9

  def update_score
    @score += current_frame.sum
    @score += current_frame[0] if spare
    return unless previous_frame == STRIKE

    @score += current_frame.sum
    @score += current_frame[0] if previous_previous_frame == STRIKE
  end

  def update_score_on_last_frame
    raise BowlingError if incomplete_last_frame_with_spare? || incomplete_last_frame_with_strike?

    @score += current_frame[0] if previous_previous_frame == STRIKE
    @score += current_frame[0..1].sum if previous_frame == STRIKE
    @score += current_frame.sum if current_frame
  end

  def incomplete_last_frame_with_spare?
    current_frame != STRIKE && current_frame.sum == 10 && current_frame.size == 2
  end

  def incomplete_last_frame_with_strike? = current_frame == STRIKE || current_frame == [10, 10]
end
