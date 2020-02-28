class Card
    attr_reader :value, :face
    def initialize(value)
        @value = value
        @face = false
    end

    def to_s
        if @face == true
            return @value
        else
            return " "
        end
    end

    def hide
        @face = false
    end

    def reveal
        @face = true
    end

    def ==(other_card)
        self.value == other_card.value
    end



end