require_relative "./board"
require_relative "./human_player"
require_relative "./ai_player"

class Game
    def initialize(human)
        @board = Board.new
        @player = human == true ? HumanPlayer.new : AiPlayer.new 
        @previous_guess = nil
    end

    def play
        @board.populate
        until @board.won?
            @board.render
            guessed_pos = @player.get_pos_1(@board.available_pos)
            @board.reveal(guessed_pos)
            @player.receive_revealed_card(guessed_pos, @board[guessed_pos].value)
            system("clear")
            @board.render
            @previous_guess = guessed_pos
            guessed_pos = @player.get_pos_2(@board.available_pos)
            if @board[@previous_guess] == @board[guessed_pos]
                @board.reveal(guessed_pos)
                @player.receive_revealed_card(guessed_pos, @board[guessed_pos].value)
                system("clear")
                @board.render
            else 
                @board.reveal(guessed_pos)
                @player.receive_revealed_card(guessed_pos, @board[guessed_pos].value)
                system("clear")
                @board.render
                sleep(2)
                @board[guessed_pos].hide
                @board[@previous_guess].hide
                system("clear")
                @board.render
            end
            system("clear")
        end
        puts "GAME OVER"
    end
end