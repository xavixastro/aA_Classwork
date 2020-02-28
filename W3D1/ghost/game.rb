require_relative "./player.rb"
require 'byebug'

class Game
    @@dictionary = Hash.new(true)
    
    def self.generate_dict_hash
        File.open('dictionary.txt').each_line{ |word| @@dictionary[word.chomp] = true }
    end

    def self.dictionary
        @@dictionary
    end

    def initialize(name1, name2)
        @fragment = ""
        @player_1 = Player.new(name1)
        @player_2 = Player.new(name2)     
        @current_player = @player_1
        @previous_player = @player_2
        Game.generate_dict_hash
    end

    def current_player
        @current_player
    end

    def previous_player
        @previous_player
    end
    
    def next_player!
        # @previous_player = @current_player
        # @current_player = @current_player == @player_1 ? @player_2 : @player_1
        @previous_player, @current_player = @current_player, @previous_player
    end

    def valid_play?(string)
        # debugger
        new_fragment = @fragment + string
        Game.dictionary.keys.any? {|word| word.start_with?(new_fragment)} 
    end

    def take_turn(player)
        input = player.guess
        until valid_play?(input)
            puts "Invalid play"
            input = player.guess
        end
        @fragment += input
    end

    def game_over?
        # debugger
        Game.dictionary.has_key?(@fragment)
    end

    def play_round
        until game_over?
            puts "Current word: #{@fragment.upcase}"
            self.take_turn(@current_player)
            self.next_player!
        end
        puts "WORD: #{@fragment}"
        puts "#{@previous_player.name} you lose!"
    end
    
end