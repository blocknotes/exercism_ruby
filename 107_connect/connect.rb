class Board
  attr_reader :winner

  def initialize(input)
    @board = input.map { _1.delete(' ') }
    @rows = board.size
    @columns = board.first.size
    add_board_borders
    @winner = o_wins || x_wins || ''
  end

  private

  attr_reader :board, :rows, :columns

  def add_board_borders
    @rows.times { board[_1] = " #{board[_1]} " }
    board.unshift(' ' * (@columns + 2))
    board.push(' ' * (@columns + 2))
  end

  def o_wins(from_index = 0)
    col = board[1].index('O', from_index)
    return unless col

    path = traverse(board, 'O', 1, col)
    path.map { |r, _c| r }.max == rows ? 'O' : o_wins(col + 1)
  end

  def x_wins(from_index = 0)
    board_x = board.map(&:chars).transpose.map(&:join)
    row = board_x[1].index('X', from_index)
    return unless row

    path = traverse(board, 'X', row, 1)
    path.map { |_r, c| c }.max == columns ? 'X' : x_wins(row + 1)
  end

  def traverse(board, symbol, row, col, seen = [])
    seen << [row, col]
    try_path(board, symbol, row, col - 1, seen)
    try_path(board, symbol, row + 1, col - 1, seen)
    try_path(board, symbol, row + 1, col, seen)
    try_path(board, symbol, row, col + 1, seen)
    try_path(board, symbol, row - 1, col + 1, seen)
    try_path(board, symbol, row - 1, col, seen)
    seen
  end

  def try_path(board, symbol, row, col, seen)
    traverse(board, symbol, row, col, seen) if board[row][col] == symbol && !seen.include?([row, col])
  end
end
