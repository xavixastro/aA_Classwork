require_relative 'slideable.rb'
require_relative 'piece.rb'
class Queen < Piece
  include Slideable

  def inspect
    "Queen"
  end

  def symbol
    return :Q
  end

  def move_dirs
    linear_dirs + diagonal_dirs
  end



end