require_relative 'piece.rb'
require 'singleton'

class NullPiece < Piece
  include Singleton

  def initialize
  end

  def inspect
    " nil "
  end

  def empty?
    true
  end

  def moves
    return nil
  end

end