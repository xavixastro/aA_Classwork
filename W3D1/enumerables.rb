class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end 
        self
    end

    def my_select(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if prc.call(ele)
        end
        new_arr
    end

    def my_reject(&prc)
        new_arr = []
        self.my_each do |ele|
            new_arr << ele if !prc.call(ele)
        end
        new_arr 
    end

    def my_any?(&prc)
        self.my_each do |el|
            return true if prc.call(el)
        end
        false
    end

    def my_all?(&prc)
        self.my_each do |el|
            return false if !prc.call(el)
        end
        true
    end

    def my_flatten
        res = []
        self.each do |el|
            if el.is_a?(Array)
                res += el.my_flatten
            else
                res << el
            end
        end
        res
    end

    def my_zip(*arrays)
        final = arrays.unshift(self)
        length = self.length
        (0...final.length).map do |sub_idx|
            (0...length).map do |idx|
                if final[sub_idx][idx] != nil 
                    final[sub_idx][idx] 
                else
                    nil
                end
            end
        end.transpose
    end

    def my_rotate(num=1)
        # dup = self
        dup = self.dup
        num >= 0 ? flag = true : flag = false
        num = num.abs
        num.times do 
            flag ? ele = dup.shift : ele = dup.pop
            flag ? dup << ele : dup.unshift(ele)
        end
        dup
    end

    def my_join(separator = "")
        str = ""
        self.each_with_index do |ele, idx|
            idx != self.length - 1 ? str += (ele + separator) : str += ele
        end
        str
    end

    def my_reverse
        arr = []
        (self.length-1).downto(0) do |idx|
            arr << self[idx]
        end
        arr
    end
end


#  # calls my_each twice on the array, printing all the numbers twice.
# return_value = [1, 2, 3].my_each do |num|
#   puts num
# end.my_each do |num|
#   puts num
# end
# # => 1
#      2
#      3
#      1
#      2
#      3

# p return_value  # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate         #=> ["b", "c", "d", "a"]
# p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

# p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
# p [ 1 ].my_reverse               #=> [1]

