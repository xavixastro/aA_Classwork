require 'byebug'

class MaxIntSet
  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    raise 'Out of bounds' if num >= @store.length || num < 0
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    if !self.include?(num)
      bucket_idx = num % @store.length 
      @store[bucket_idx] << num 
    end
  end

  def remove(num)
    bucket_idx = num % @store.length 
    @store[bucket_idx].delete(num)
  end

  def include?(num)
    bucket_idx = num % @store.length
    @store[bucket_idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    resize! if @count == num_buckets
    if !self.include?(num)
      # while @count < 1
        bucket_idx = num % @store.length
        @store[bucket_idx] << num
        @count += 1
      # end
    end
  end

  def remove(num)
    if self.include?(num)
        bucket_idx = num % @store.length
        @store[bucket_idx].delete(num)
        @count -= 1
    end
  end

  def include?(num)
    bucket_idx = num % @store.length
    @store[bucket_idx].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store.dup
    @store = Array.new(num_buckets*2) { Array.new } 
    @count = 0
    old_store.each do |ele|
      ele.each {|el| self.insert(el)} 
    end

  end

end
