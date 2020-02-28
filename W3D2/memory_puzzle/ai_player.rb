require "byebug"

class AiPlayer

    def initialize
        @known_cards = Hash.new{|h,k| h[k] = []}
        @matched_cards = []
    end

    def receive_revealed_card(pos, val)
        @known_cards[val] << pos unless @known_cards[val].include?(pos)
        if @known_cards[val].length > 1
            receive_match(@known_cards[val][0], @known_cards[val][1])
        end
    end

    def receive_match(pos1, pos2)
        @matched_cards = [pos1, pos2]
    end

    def get_pos_1(arr)
        if !@matched_cards.empty? && arr.include?(@matched_cards.first)
            pos1 = @matched_cards.first
            return pos1 
        else
            return arr.sample
        end    
    end

    def get_pos_2(arr)
        if !@matched_cards.empty? && arr.include?(@matched_cards.last)
            pos2 = @matched_cards.last
            @matched_cards = []
            return pos2
        else
            return arr.sample
        end    
    end



end