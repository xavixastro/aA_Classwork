# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    #PART 1
    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum / (self.length.to_f)
    end

    def median
        return nil if self.empty?
        sorted = self.sort
        return (sorted[sorted.length/2-1] + sorted[sorted.length/2]) / 2.0 if sorted.length.even?
        return sorted[sorted.length/2]
    end

    def counts
        hash = Hash.new(0)
        self.each {|el| hash[el]  += 1}
        hash
    end

    #PART 2
    def my_count(value)
        count = 0
        self.each {|ele| count += 1 if ele == value}
        count 
    end
    
    def my_index(value)
        self.each_with_index { |ele, i| return i if ele == value}
        return nil 
    end

    def my_uniq
        new_arr = []
        self.each {|ele| new_arr << ele if !new_arr.include?(ele)}
        new_arr
    end

    def my_transpose
        new_arr = Array.new(self.length) { Array.new(self.length) }
        self.each_with_index do |subArr, i1|
            subArr.each_with_index do |ele, i2|
                new_arr[i2][i1] = ele
            end
        end
        new_arr
    end
end
