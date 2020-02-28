require 'byebug'


class Board

    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) { Array.new(n,:N) }
        @size = n * n
    end

    def self.print_grid(grid)
        grid.each do |sub_arr|
            puts sub_arr.join(" ")
        end
    end

    def [](pos)
        row = pos.first
        col = pos.last
        @grid[row][col]
    end

    def []=(pos, val)
        row = pos.first
        col = pos.last
        @grid[row][col] = val
    end

    def num_ships
        count = 0
        @grid.each do |arr|
            count += arr.count(:S)
        end
        count
    end

    def attack(pos)
        if self[pos] == :S
            self[pos] = :H
            puts 'you sunk my battleship!'
            return true
        else
            self[pos] = :X
            return false
        end
    end


    def place_random_ships
        quarter = @size/4
        
        while num_ships < quarter
            row_idx = rand(0...@grid.length)
            col_idx = rand(0...@grid.length)
            @grid[row_idx][col_idx] = :S if @grid[row_idx][col_idx] != :S
            row_idx = 0
            col_idx = 0
        end
    end

    def hidden_ships_grid
        new_arr = Array.new(@grid.length) {Array.new(@grid.length)}
        @grid.each_with_index do |sub_arr, idx1|
            sub_arr.each_with_index do |ele,idx2|
                if ele == :S
                    new_arr[idx1][idx2] = :N
                else
                    new_arr[idx1][idx2] = ele
                end
            end
        end
        new_arr
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end



end
