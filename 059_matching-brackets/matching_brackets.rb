module Brackets
  def paired?(input)
    list = []
    input.each_char do |char|
      case char
      when '(' then list << :open_parentheses
      when ')' then return false if list.pop != :open_parentheses
      when '[' then list << :open_brackets
      when ']' then return false if list.pop != :open_brackets
      when '{' then list << :open_braces
      when '}' then return false if list.pop != :open_braces
      end
    end
    list.empty?
  end

  module_function :paired?
end
