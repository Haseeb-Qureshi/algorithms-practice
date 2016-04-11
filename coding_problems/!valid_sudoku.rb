# @param {Character[][]} board
# @return {Boolean}
def is_valid_sudoku(board)
  SudokuBoard.new(board).valid?
end

class SudokuBoard
  def initialize(board)
    @board = board
    @size = board.length
  end

  def valid?
    rows_valid? && cols_valid? && squares_valid?
  end

  private

  def rows_valid?
    @board.each_index do |i|
      row = []
      @board[0].length.times do |j|
        row << [i, j]
      end
      return false unless all_valid?(row)
    end
    true
  end

  def cols_valid?
    @board[0].length.times do |j|
      col = []
      @board.each_index do |i|
        col << [i, j] unless @board[i][j] == '.'
      end
      return false unless all_valid?(col)
    end
    true
  end

  def squares_valid?
    idxs = (0...@size).step(3).to_a * 2
    square_starts = idxs.combination(2).to_a.uniq
    square_starts.all? { |i, j| valid_square_at?(i, j) }
  end

  def valid_square_at?(i, j)
    square = []
    (i..i + 2).each do |n|
      (j..j + 2).each do |m|
        square << [n, m] unless @board[n][m] == "."
      end
    end
    all_valid?(square)
  end

  def all_valid?(arr)
    set = Array.new(@size + 1)
    arr.each do |i, j|
      el = @board[i][j]
      next if el == '.'
      if set[el.to_i]
        return false
      else
        set[el.to_i] = true
      end
    end
    true
  end
end

board = [
  ".87654321",
  "2........",
  "3........",
  "4........",
  "5........",
  "6........",
  "7........",
  "8........",
  "9........"]

p is_valid_sudoku(board)
