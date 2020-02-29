require_relative "./00_tree_node.rb"

class KnightPathFinder
    
    def self.valid_moves?(pos)
        moves = []
        x, y = pos

        #x+1, y+2
        #x-1, y+2
        #x+2, y+1
        #x-2, y+1

        #x+1, y-2
        #x-1, y-2
        #x+2, y-1
        #x-2, y-1

    end

    def initialize(start_pos)
        @start_pos = start_pos
        @considered_positions = []
        @root_node = PolyTreeNode.new(start_pos)
    end

    def build_move_tree

    end


end