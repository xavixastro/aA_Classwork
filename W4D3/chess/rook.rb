require_relative 'slideable.rb'
require_relative 'piece.rb'
class Rook < Piece
  include Slideable

  def inspect
    "Rook"
  end

  def symbol
    return :R
  end

  def move_dirs
    linear_dirs
  end



end
