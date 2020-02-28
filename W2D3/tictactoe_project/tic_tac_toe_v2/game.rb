require_relative './board.rb'
require_relative './human_player.rb'

class Game

    def initialize(size, *marks)
        @players = []
        marks.each {|mark| @players << HumanPlayer.new(mark)}
        @board = Board.new(size)
        @current = @players.first
    end

    def switch_turn
        @players.rotate!
        @current = @players.first
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