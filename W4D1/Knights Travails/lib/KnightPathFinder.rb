require_relative "./00_tree_node.rb"

class KnightPathFinder

    attr_reader :root_node
    
    def self.valid_moves(pos)
        moves = []
        x, y = pos

        #moving up
        moves << [x+1, y+2]
        moves << [x-1, y+2]
        moves << [x+2, y+1]
        moves << [x-2, y+1]

        #moving down
        moves << [x+1, y-2]
        moves << [x-1, y-2]
        moves << [x+2, y-1]
        moves << [x-2, y-1]


        moves.select{|move| (0..7).include?(move[0]) && (0..7).include?(move[1])}
    end

    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        
    end

    def new_move_positions(pos)
        available_moves = KnightPathFinder.valid_moves(pos)
        available_moves.reject!{|pos| @considered_positions.include?(pos)}
        @considered_positions += available_moves
        available_moves
    end

    def build_move_tree
        queue = [@root_node]

        until queue.empty?
            node = queue.shift
            positions = self.new_move_positions(node.value)
            positions.each do |pos|
                new_node = PolyTreeNode.new(pos)
                new_node.parent = node
                queue << new_node
            end
        end
    end

    def find_path(end_pos)
        p trace_path_back(end_pos)
    end

    def trace_path_back(end_pos)
        arr = []
        end_node = @root_node.bfs(end_pos)
        while end_node != @root_node
            arr.unshift(end_node.value)  ##can also use shovel but thenn have to reverse
            end_node = end_node.parent
        end
        arr.unshift(@root_node.value)
        arr
    end

end

kpf = KnightPathFinder.new([0, 0])
kpf.build_move_tree
kpf.find_path([7,6])