class Scale
  SCALES = {
    sharp: %w[A A# B C C# D D# E F F# G G#],
    flat: %w[A Bb B C Db D Eb E F Gb G Ab]
  }.freeze
  SHARP_STARTING = %w[C G D A E B F# a e b f# c# g# d#].freeze
  FLAT_STARTING = %w[F Bb Eb Ab Db Gb d g c f bb eb].freeze
  STEPS = { 'm' => 1, 'M' => 2, 'A' => 3 }.freeze

  attr_reader :tonic

  def initialize(tonic) = @tonic = tonic

  def chromatic
    @chromatic ||= begin
      tonic_index = SCALES[type].index(upcase_tonic)
      SCALES[type][tonic_index..] + SCALES[type][...tonic_index]
    end
  end

  def interval(input)
    note = 0
    steps = input.split('').map { STEPS[_1] }
    sequence = steps.map do |step|
      note += step
      note %= 12
      chromatic[note]
    end
    [upcase_tonic] + sequence
  end

  private

  def type
    @type ||=
      case tonic
      when *SHARP_STARTING then :sharp
      when *FLAT_STARTING then :flat
      end
  end

  def upcase_tonic
    @upcase_tonic ||= begin
      t = tonic.dup
      t[0] = t[0].upcase
      t
    end
  end
end
