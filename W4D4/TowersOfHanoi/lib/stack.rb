require 'byebug'

class Stack

  attr_accessor :top_of_stack, :array

  def initialize(value, array = [])
    @value = value
    @array = array 
    @top_of_stack = @array.last.nil? ? 10 : @array.last
  end

  def place_on_top(other_stack)

    if self.top_of_stack < other_stack.top_of_stack
      other_stack.array << self.array.pop
      @top_of_stack = array.last
      other_stack.top_of_stack = other_stack.array.last
    else
      raise "Invalid move"
    end
  end

    def inspect
    return "<test>"
    end 


end

# s1 = Stack.new(1, [5,4,3,2,1])
# s2 = Stack.new(2)
# s3 = Stack.new(3)

# s1.place_on_top(s2)
# s1.place_on_top(s2)
