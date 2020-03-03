require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos

  end

  def losing_node?(evaluator)

    return false if @board.over? && (@board.winner == nil || @board.winner == evaluator)
    return true if @board.over? && @board.winner != evaluator

    if self.next_mover_mark == evaluator
      self.children.all? do |child|
        child.losing_node?(evaluator)
      end
    else
      self.children.any?{|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    return true if @board.over? && @board.winner == evaluator
    return false if @board.over? && (@board.winner == nil || @board.winner != evaluator)
    if self.next_mover_mark == evaluator
      self.children.any?{|child| child.winning_node?(evaluator)}
    else
      self.children.all?{|child| child.winning_node?(evaluator)}
    end
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    empty_pos = []

    @board.rows.each_with_index do |row, i1|
      row.each_with_index do |ele, i2|
        if @board.empty?([i1, i2])
          empty_pos << [i1, i2]
        end
      end
    end

    possible_states = []

    empty_pos.each do |pos|
      dup_board = @board.dup
      dup_board[pos] = @next_mover_mark
      mark = ((@next_mover_mark == :x) ? :o : :x)
      prev_move_pos = pos 
      new_node = TicTacToeNode.new(dup_board, mark, prev_move_pos) 
      possible_states << new_node
    end

    possible_states

  end




end
