class HumanPlayer

    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        puts "Player #{@mark}, enter two numbers representing a position in the format `row col`"
        pos = gets.chomp.split.map(&:to_i)
        
        while !legal_positions.include?(pos)
            puts "#{pos} is not a legal position"
            puts "Player #{@mark}, enter two numbers representing a position in the format `row col`"
            pos = gets.chomp.split.map(&:to_i)
        end

        pos
    end

end
