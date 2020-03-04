require_relative './piece.rb'

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}

  end

  def build_board
    @grid.each_with_index do |row, i|
        row.each_with_index do |ele, j|
        if [0, 1, 6, 7].include?(i)
          @grid[i][j] = Piece.new
        else
          @grid[i][j] = nil
        end
      end
    end

  end

  def [](pos)
    x, y = pos
    @grid[x][y] 
  end

  def []=(pos, val)
    x, y = pos
    @grid[x][y] = val
  end

  def move_piece(start_pos, end_pos)
    raise "Not valid move" if !check_pos?(start_pos) || !check_pos?(end_pos)
    raise "No piece in there" if self[start_pos] == nil
    self[start_pos], self[end_pos] = nil, self[start_pos]
  end

  def check_pos?(pos)
    x, y = pos
    return true if (0..7).include?(x) && (0..7).include?(y)
    false
  end
  # def render
  #   @grid.each do |row|
  #     puts row.join(" ")

  #   end
  # end

end

