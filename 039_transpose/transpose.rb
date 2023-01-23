module Transpose
  module_function

  def setup_matrix(input)
    splitted_input = input.split("\n")
    max_length = splitted_input.map(&:length).max
    splitted_input.map { _1.ljust(max_length, "\n").chars }
  end

  def transpose(input)
    transposed_matrix = setup_matrix(input).transpose
    transposed_matrix.map { _1.join.gsub(/\n*\z/, '').tr("\n", ' ') }.join("\n")
  end
end
