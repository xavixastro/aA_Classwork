class Player

    attr_reader :name

    def initialize(name)
        @name = name
    end

    def alert_invalid_guess(letter)
        ("a".."z").to_a.include?(letter)
    end

    def guess
        puts "Player #{@name}, please type in a letter"
        input = gets.chomp
        until alert_invalid_guess(input)
            puts "Invalid character, please type in a letter a..z"
            input = gets.chomp
        end
        return input
    end
end