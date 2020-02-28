# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
    (num.downto(2)).each do |i|
        if num % i == 0 && prime?(i)
            return i
        end
    end
end

def prime?(n)
    return false if n < 2

    (2...n).none? { |factor| n % factor == 0 }

end

def unique_chars?(str)
    str.each_char.with_index do |char1, i|
        str.each_char.with_index do |char2, j|
            return false if char1 == char2 && i != j
        end
    end
    true
end



def dupe_indices(arr)

    # debugger

    hash = Hash.new { |h, k| h[k] = [] }
    arr.each_with_index do |el, idx|
        hash[el] << idx
    end 

    hash.each do |k, v|
        if v.length == 1
            hash.delete(k)
        end
    end

    hash
end

def ana_array(array1, array2)
    return false if array1.length != array2.length
    count1 = Hash.new(0)
    array1.each { |el| count1[el] += 1 }
    count2 = Hash.new(0)
    array2.each { |el| count2[el] += 1 }
    count1 == count2
end