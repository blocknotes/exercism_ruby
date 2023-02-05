module Board
  module_function

  def transform(input)
    raise ArgumentError unless valid_board?(input)

    mines = find_mines(input)
    counters = update_counters(input, mines)
    prepare_result_board(input, counters)
  end

  def valid_board?(input)
    return false if (input.join.split('').uniq - [' ', '*', '+', '-', '|']).any?

    input[1..-2].each do |line|
      return false if line[0] != '|' || line[-1] != '|'
    end
    input.map(&:size).uniq.size == 1
  end

  def find_mines(input)
    mines = []
    input.each_with_index do |line, i|
      next if line[0] == '+'

      line.chars.each_with_index do |char, j|
        mines << [i, j] if char == '*'
      end
    end
    mines
  end

  def update_counters(input, mines)
    counters = Array.new(input.size) { Array.new(input.first.size, 0) }
    mines.each do |i, j|
      counters[i - 1][j] += 1
      counters[i + 1][j] += 1
      counters[i][j - 1] += 1
      counters[i][j + 1] += 1
      counters[i - 1][j - 1] += 1
      counters[i + 1][j - 1] += 1
      counters[i - 1][j + 1] += 1
      counters[i + 1][j + 1] += 1
    end
    counters
  end

  def prepare_result_board(input, counters)
    result = input.map.with_index do |line, i|
      line.chars.map.with_index do |char, j|
        char == ' ' && counters[i][j].positive? ? counters[i][j] : char
      end
    end
    result.map(&:join)
  end
end
