require_relative './board.rb'
require_relative './human_player.rb'

class Game

    def initialize(player_1_mark, player_2_mark)
        @player1 = HumanPlayer.new(player_1_mark)
        @player2 = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current = @player1
    end

    def switch_turn
        @current = @current == @player1 ? @player2 : @player1
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current.get_position
            @board.place_mark(pos, @current.mark)
            if @board.win?(@current.mark)
                @board.print
                puts "Congratulations player #{@current.mark}, you WIN!"
                return
            else
                self.switch_turn
            end
        end
        @board.print
        puts "DRAW"
    end

end