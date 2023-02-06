class SecretHandshake
  EVENTS = {
    1 => 'wink',
    2 => 'double blink',
    4 => 'close your eyes',
    8 => 'jump',
    16 => 'reverse'
  }.freeze

  attr_reader :commands

  def initialize(handshake)
    @commands = []
    return unless handshake.is_a?(Integer)

    @commands = EVENTS.select { (handshake & _1).positive? }.values
    @commands.reverse! if reverse?
  end

  private

  def reverse? = @commands.last == 'reverse' ? @commands.pop : false
end
