module Bob
  module_function

  def hey(message)
    if /[A-Z]+/.match?(message) && !/[a-z]+/.match?(message) # yelling
      message.end_with?('?') ? "Calm down, I know what I'm doing!" : 'Whoa, chill out!'
    else
      case message
      when /\A[[:space:]]*\z/ then 'Fine. Be that way!'
      when /\A.+\?\s*\z/ then 'Sure.'
      else 'Whatever.'
      end
    end
  end
end
