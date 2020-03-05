# require_relative 'board'


class Piece

  attr_reader :color

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos

  end

  # def inspect
  #   "Piece"
  # end

  # def to_s

  # end

  def empty?
    false
  end

  def valid_moves


  end


end 


# x, y = pos [0,0]
# poss_moves= [[-1, -1], [2,-1]]



# result = []
# poss_moves.each do |pos|
# # x, y = pos
# new_x = x + pos[0] 
# new_y = y + pos[1]
# result << [new_x, new_y]
# end

# result