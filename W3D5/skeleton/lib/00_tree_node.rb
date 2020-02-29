class PolyTreeNode

    attr_reader :parent, :children
    attr_accessor :value

    def initialize(value)
        @value = value  #A
        @parent = nil
        @children = []  #[B,C]
    end

    def parent=(new_parent)  #self = me, parent = new_dad

        #new_dad children = [me]

        #dad children = [sis, bro]

        @parent.children.delete(self) if @parent != nil

        @parent = new_parent  
        

        if @parent != nil && !@parent.children.include?(self) 
            @parent.children << self
        end

        # self => [value=5, children=[6,7], parent=1]
        
        #parent = [value=1, children=[self], parent=nil]
        #self.parent=(1)
        
        #old_parent = 2 [value="2", children=[self]]
        
        # unless self.parent != nil
        #     @parent.children << self
        # end

    end
    
    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise "Child node does not belong to children" if !@children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        @children.each do |child| #6
            search = child.dfs(target_value)
            return search if search != nil
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.length == 0
            first_node = queue.shift
            return first_node if first_node.value == target_value
            first_node.children.each do |child|
                queue.push(child)
            end
        end
        nil
    end

    #check if self value before the queue is the target

    #target_value => amanda
    #queue = [sean]
    #first_node = amanda

    #             [Sam]
    #     [Jay]            [tom]
    # [mary][peter]    [amanda][sean]
    

end





