class HumanPlayer

    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position 
        puts "Player #{@mark}, enter two numbers representing a position in the format `row col`"
        input = gets.chomp.split
        
        alpha = ("a".."x").to_a
        if input.length != 2 || input.any?{|char| alpha.include?(char.downcase)}
            raise "Invalid entry"
        end 
        input.map(&:to_i)
    end

end
