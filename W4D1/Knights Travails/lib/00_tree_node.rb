class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def inspect
        "Value: #{@value} Children: #{@children}"
    end

    def parent=(new_parent)
        @parent.children.delete(self) if @parent != nil
        @parent = new_parent
        @parent.children << self unless @parent == nil
    end

    def add_child(new_child)
        new_child.parent=(self) unless @children.include?(new_child)
    end

    def remove_child(old_child)
        raise if !@children.include?(old_child)
        old_child.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        self.children.each do |child|
            res = child.dfs(target_value)
            return res if res
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            node = queue.shift
            return node if node.value == target_value
            node.children.each do |child|
                queue << child
            end
        end
        nil
    end

    



end





