class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
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

    



end





