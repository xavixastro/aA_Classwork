require 'byebug'

module Slideable

  LINEAR_MOVES = [[1,0], [-1,0], [0, 1], [0,-1]]
  DIAGONAL_MOVES = [[1,1],[-1,1],[-1,-1],[1,-1]]

  def linear_dirs
    return LINEAR_MOVES
  end

  def diagonal_dirs
    return DIAGONAL_MOVES
  end

  def moves
    moves_arr = []
    move_dirs.each do |dir|
      moves_arr.concat(grow_unblocked_moves_in_dir(dir[0], dir[1]))
    end
    moves_arr
  end

  def move_dirs
    #this will be overwritten by move_dirs from the subclasses 
  end
  # dx = -1 
  # dy = 0 
  
  # (1) we encounter a piece 
  # (2) out of bounds 

  def grow_unblocked_moves_in_dir(dx, dy)
    x, y = @pos
    valid_positions = []
    new_x = x + dx
    new_y = y + dy
    new_pos = [new_x, new_y]
    
    while @board.valid_pos?(new_pos)  
    # debugger

      next_piece = @board[new_pos]
      if next_piece.empty?
        valid_positions << new_pos
      elsif self.color != next_piece.color
        valid_positions << new_pos
        break
      else
        break
      end

      new_x += dx
      new_y += dy
      new_pos = [new_x, new_y] 
      
    end

  valid_positions
  end

end

