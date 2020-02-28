class Board

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, "_")}
    end

    def valid?(pos)
        return true if (pos.first < @grid[0].length && pos.last < @grid[0].length) && pos.all?{|idx| idx >= 0}
        false
    end
   
    def empty?(pos)
        @grid[pos.first][pos.last] == "_"
    end

    def place_mark(pos, mark)
        if valid?(pos) && empty?(pos)
            @grid[pos.first][pos.last] = mark
        else
            raise "invalid position"
        end
    end
    
    def print
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def win_row?(mark)
        @grid.any? { |row| row.uniq.length == 1 && row.uniq.first == mark }
    end

    def win_col?(mark)
        cols = @grid.transpose
        cols.any? { |col| col.uniq.length == 1 && col.uniq.first == mark }
    end

        #tested up to here

    def win_diagonal?(mark)
        diag1 = []
        diag2 = []
        @grid.each_with_index do |row, idx|
            diag1 << @grid[idx][idx]
            diag2 << @grid[idx][(idx+1)*-1]
        end
        (diag1.uniq[0] == mark && diag1.uniq.length == 1) || (diag2.uniq[0] == mark && diag2.uniq.length == 1)
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each do |row|
            row.each do |el|
                return true if el == "_"
            end
        end
        false
    end

    def legal_positions
        legal = []
        @grid.each_with_index do |row, idx1|
            row.each_with_index do |ele, idx2|
                legal << [idx1, idx2] if ele == "_"
            end
        end
        legal
    end



end