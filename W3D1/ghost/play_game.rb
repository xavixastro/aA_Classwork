require_relative "./player.rb"
require_relative "./game.rb"


puts "Player 1 choose your name"
name1 = gets.chomp
puts "player 2 choose your name"
name2 = gets.chomp
game = Game.new(name1, name2)
game.play_round