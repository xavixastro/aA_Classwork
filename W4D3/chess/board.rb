require_relative './piece.rb'
require_relative 'rook.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'

require_relative 'null_piece.rb'

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}

  end

  def build_board
    @grid.each_with_index do |row, i|
        row.each_with_index do |ele, j|
        if [0, 7].include?(i)
          # @grid[i][j] = Rook.new(:black, self, [i,j])
          @grid[0][0] = Rook.new(:black, self, [i,j])
          @grid[0][7] = Rook.new(:black, self, [i,j])
          @grid[7][0] = Rook.new(:white, self, [i,j])
          @grid[7][7] = Rook.new(:white, self, [i,j])
          @grid[0][3] = Queen.new(:black, self, [i,j])
          @grid[7][3] = Queen.new(:white, self, [i,j])
          @grid[0][4] = "BK"
          @grid[7][4] = "WK"
          @grid[0][1] = "BC"
          @grid[0][6] = "BC"
          @grid[7][1] = "WC"
          @grid[7][6] = "WC"
          @grid[0][2] = Bishop.new(:black, self, [i,j])
          @grid[0][5] = Bishop.new(:black, self, [i,j])
          @grid[7][2] = Bishop.new(:white, self, [i,j])
          @grid[7][5] = Bishop.new(:white, self, [i,j])
        elsif [1, 6].include?(i)
          @grid[i][j] = "pawn"
        else
          @grid[i][j] = NullPiece.instance
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
    raise "Not valid move" if !valid_pos?(start_pos) || !valid_pos?(end_pos)
    raise "No piece in there" if self[start_pos] == NullPiece.instance
    self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]
  end

  def valid_pos?(pos)
    x, y = pos
    return true if (0..7).include?(x) && (0..7).include?(y)
    false
  end

  def render
    @grid.each do |row|
      puts row.map{|el| el.inspect}.join(" ")

    end
  end

end

b= Board.new
p b.build_board
b.render

# rook = b[[3,3]]
# p rook.moves