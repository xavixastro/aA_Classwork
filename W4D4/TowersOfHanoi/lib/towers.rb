require_relative 'stack'

class Towers

  def initialize
    @stack1 = Stack.new(1, [5,4,3,2,1])
    @stack2 = Stack.new(2)
    @stack3 = Stack.new(3)
    @stacks = [ @stack1, @stack2, @stack3 ]
  end

  def move(from, to)
    raise "Invalid" if from.array.empty?
    from.place_on_top(to)
  end

  def play
    until won?
      render
      puts 'enter 2 numbers seperated by a comma like: 1,2'
      # begin
      input = gets.chomp.split(',')
      input.map! { |el| el.to_i }
      raise if input.any? {|el| !(1..3).include?(el)}
      # rescue
      #   retry
      # else
      move(@stacks[input[0]-1], @stacks[input[1]-1])
      
      
    end
  
  end


  def won?
    @stack2.array == [1,2,3,4,5] || @stack3.array == [1,2,3,4,5]
  end

  def render
    @stacks.each do |stack|
      p stack.array
    end

  end 
  
end

tower = Towers.new
tower.play

