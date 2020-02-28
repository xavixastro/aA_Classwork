require_relative "./card.rb"
require "byebug"

class Board
    def initialize
        @grid = Array.new(4){Array.new(4)}

    end

    def populate
        cards = []
        ("a".."h").to_a.concat(("a".."h").to_a).each do |char|
            new_card = Card.new(char)
            cards << new_card
        end
        cards.shuffle!
        @grid.each_with_index do |row, i|
            @grid[i] = cards.shift(4)
        end
    end

    def render
        @grid.each do |row|
            puts row.map{|ele| ele.to_s}.join(" ")
        end
    end

    def won?
        @grid.all?{|row| row.all?{|ele| ele.face}}
    end

    def reveal(guessed_pos)
       
        row, col = guessed_pos
        if !@grid[row][col].face
            @grid[row][col].reveal
            return @grid[row][col].value
        end
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def available_pos
        arr = []
        @grid.each_with_index do |row, i|
            row.each_with_index do |ele, j|
                arr << [i, j] if ele.face == false
            end
        end
        arr
    end


end