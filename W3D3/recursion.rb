require 'byebug'

def range(start, end_num)
    return [] if start == end_num || end_num < start
    [start] + range(start+1, end_num)

end

# p range(1, 5)

def exp_1(num, exp)
    return 1 if exp == 0
    num * exp_1(num, exp-1)
end

# p exp_1(2, 3)

def exp_2(num, exp)
    return 1 if exp == 0
    return num if exp == 1
    if exp.odd?
        return num * (exp_2(num, (exp - 1) / 2))  ** 2
    else
        return exp_2(num, exp / 2) ** 2  
    end 
end

# p exp_2(2, 4)

class Array
    def deep_dup
        arr = []

        self.each do |ele|
            if !ele.is_a?(Array)
                arr << ele # [ele.dup]
            else
                arr << ele.deep_dup
            end
        end
        arr
    end

end


# obj1 = [1, [2], [3, [4]]]
# obj2 = obj1.deep_dup
# p obj2                              # => [1, [2], [3, [4]]]
# p obj2.object_id == obj1.object_id  # => false
# p obj2.object_id[2] == obj1.object_id[2]
# obj2[2][0] = 5
# p obj1
# p obj2

def rec_fib(n)
    return [] if n <= 0
    return [1] if n == 1
    return [1,1] if n == 2
    seq = rec_fib(n-1)
    next_ele = seq[-1] + seq[-2]
    seq << next_ele
end

# p rec_fib(10)

def iter_fib(n)
    return [] if n <= 0
    return [1] if n == 1
    return [1,1] if n == 2
    arr = [1,1]
    (n-2).times do 
        arr << arr[-1] + arr[-2]
    end
    arr
end

# p iter_fib(10)


def bsearch(arr, target)
    return nil if arr.length == 0
    return arr.length/2 if arr[arr.length/2] == target
    left = arr[0...arr.length/2]
    right = arr[(arr.length/2+1)..-1]
    if bsearch(left, target)
        return bsearch(left, target)
    elsif bsearch(right, target)
        return (arr.length/2 + 1 + bsearch(right, target))
    else
        return nil
    end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

class Array #[6,5,3,1]
    def merge_sort
        return [] if self.empty?
        return self if self.length == 1

        left = self[0...self.length/2]
        right = self[self.length/2..-1]

        #[6].merge([5])
        (left.merge_sort).merge(right.merge_sort) # => [5, 6].merge([1, 3])
    end

    def merge(other) #self =>  [5, 6] other=>[1, 9]

        # return [] if other.empty? && self.empty?
        return other if self.empty?
        return self if other.empty?
        # arr = self + other

        if self[0] < other[0]
            return [self.shift] + self.merge(other)
        else
            return [other.shift] + self.merge(other)
        end


        # i = 0
        # while i < arr.length
        #     if arr[i] == arr.min
        #         return [[self[0],other[0]].min] + arr[0...i].merge(arr[i+1..-1])
        #     end
        #     i += 1
        # end

        # arr = []
        # while self.length + other.length > 0
        #     if self[0] < other[0]
        #         arr << self.shift
        #     else
        #         arr << other.shift
        #     end
        #     if other.length == 0
        #         arr += self 
        #         break
        #     elsif self.length == 0
        #         arr += other i
        #         break
        #     end
        # end
        
        # arr
        # return self += other if self < other
        # return other += self if other < self
    end
end

# p [6,5,3,1, -7, 33, 4, 2, 33].merge_sort
# p [].merge_sort
# p [6].merge_sort
# p [8, 6].merge_sort

class Array
    def subsets #[1, 2]
        # debugger
        return [[], [self[0]]] if self.length == 1
        return [[]] if self.empty?
        # ele = self.shift
        # return [self.subsets, [ele]]
        ele = self.pop
        subs = self.subsets
        return subs + subs.deep_dup.map do |sub| 
            sub << ele
        end
        #   [[], [1]] + [[2], [1,2]]

    end
end


# p [].subsets # => [[]]
# p [1].subsets # => [[], [1]]
# p ([1, 2]).subsets # => [[], [1], [2], [1, 2]]
# p ([1, 2, 3]).subsets
# # => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(array) #[1, 2, 3]
    #permutation([2,3]) =>  [[2,3], [3, 2]]
    return [] if array.empty?
    return [array] if array.length == 1
    ele = array.shift #1

    overall = []
    permutations(array).each_with_index do |subPer, idx| #[2,3]
        (0..subPer.length).each do |jdx| #1
            overall << subPer[0...jdx] + [ele] + subPer[jdx..-1]
        end
    end
    return overall
end


# hash = Hash.new(0)
# [1,2,3,4,5].permutation.to_a.each { |ele| hash[ele] += 1 }
# permutations([1,2,3,4,5]).each { |ele| hash[ele] += 1 }

# p hash.values

def greedy_make_change(amount, coins = [25, 10, 5, 1])
    return [1] if amount == 1

    # purse = Hash.new(0) {}
    new_coins = coins.select{|coin| coin <= amount}
    [new_coins.max] + greedy_make_change(amount-new_coins.max, coins)
end

# p greedy_make_change(24, [10,7,1])

def make_better_change(amount, coins)
    return [] if amount == 0

    min_length = []

    coins.select {|low| low <= amount }.each do |top_coin|
        arr = [top_coin]
        
        if amount - top_coin > 0
            arr += make_better_change(amount - top_coin, coins.select {|coin| coin <= top_coin})
        end
        min_length = arr if arr.length < min_length.length || min_length.empty?
    end
    min_length
end


    # all_permutations.inject do |shortest, permutation|
    #     if shortest.length > permutation.length
    #         permutation
    #     else
    #         shortest
    #     end
    # end

p make_better_change(46, [10,7,1])
p make_better_change(20, [15,10, 1])