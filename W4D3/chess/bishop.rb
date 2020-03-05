require_relative 'slideable.rb'
require_relative 'piece.rb'
class Bishop < Piece
  include Slideable

  def inspect
    "Bishop"
  end

  def symbol
    return :B
  end

  def move_dirs
    diagonal_dirs
  end



end