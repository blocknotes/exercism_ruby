class LogLineParser
  attr_reader :log_level, :message

  def initialize(line)
    @line = line
    parse_line
  end

  def reformat
    "#{message} (#{log_level})"
  end

  private

  attr_reader :line

  def parse_line
    return if line.nil?

    @log_level, @message = line.scan(/\s*\[(.+)\]:(.+)/).first
    @log_level&.downcase!
    @message&.strip!
  end
end
