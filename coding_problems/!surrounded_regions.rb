# @param {Character[][]} board
# @return {Void} Do not return anything, modify board in-place instead.
def solve(board)
  Board.new(board).solve!
end

class Board
  OUTER = "X"
  CAPTURABLE = "O"
  def initialize(board)
    @board = board
    @explored = new_matrix
  end

  def solve!
    (0...@board.length).each do |i|
      (0...@board[0].length).each do |j|
        if unexplored?(i, j) && !can_reach_edge_from_pos?(i, j)
          p [i, j]
          pp @explored
          p @board[i][j]
          mark_area_bfs!(i, j)
        end
      end
    end
    @board
  end

  private

  def unexplored?(i, j)
    !@explored[i][j] && @board[i][j] == CAPTURABLE
  end

  def mark_area_bfs!(i, j)
    return if @board[i][j] == OUTER

    queue = [[i, j]]

    until queue.empty?
      i, j = queue.shift
      next if @board[i][j] == OUTER
      @board[i][j] = OUTER
      capturable_neighbors(i, j).each { |i2, j2| queue << [i2, j2] }
    end
  end

  def can_reach_edge_from_pos?(i, j)
    can_reach_edge_from_pos_bfs?(i, j)
  end

  def can_reach_edge_from_pos_bfs?(i, j)
    queue = [[i, j]]

    until queue.empty?
      i, j = queue.shift
      return true if edge?(i, j)
      next if @explored[i][j]
      @explored[i][j] = true
      capturable_neighbors(i, j).each { |i2, j2| queue << [i2, j2] unless @explored[i2][j2] }
    end
    false
  end

  def edge?(i, j)
    i == 0 || i == @board.length - 1 || j == 0 || j == @board[0].length - 1
  end

  def capturable_neighbors(i, j)
    valid_neighbors(i, j).select { |i2, j2| @board[i2][j2] == CAPTURABLE }
  end

  def valid_neighbors(i, j)
    neighbors(i, j).select { |i2, j2| in_range?(i2, j2) }
  end

  def neighbors(i, j)
    [
      [i + 1, j],
      [i - 1, j],
      [i, j + 1],
      [i, j - 1]
    ]
  end

  def in_range?(i, j)
    (0...@board.length).cover?(i) && (0...@board[0].length).cover?(j)
  end

  def new_matrix
    Array.new(@board.length) { Array.new(@board[0].length, false) }
  end

  def can_reach_edge_from_pos_dfs?(i, j)
    @explored[i][j] = true
    return true if edge?(i, j)

    capturable_neighbors(i, j).each do |i2, j2|
      next if @explored[i2][j2]
      return true if can_reach_edge_from_pos_dfs?(i2, j2)
    end
    false
  end

  def mark_area_dfs!(i, j)
    return if @board[i][j] == OUTER

    @board[i][j] = OUTER
    capturable_neighbors(i, j).each { |i2, j2| mark_area!(i2, j2) }
  end
end

board = [
  "OXOOOOOOO",
  "OOOXOOOOX",
  "OXOXOOOOX",
  "OOOOXOOOO",
  "XOOOOOOOX",
  "XXOOXOXOX",
  "OOOXOOOOO",
  "OOOXOOOOO",
  "OOOOOXXOO"
]
require 'pp'
pp board
pp Board.new(board).solve!
