def partition(arr, num)
    new_arr1=  []
    new_arr2 = []
    arr.each do |i|
        if i >= num 
            new_arr2 << i 
        else
            new_arr1 << i 
        end
    end
    [new_arr1, new_arr2]
end

def merge(hash1, hash2)
    new_hash = {}
    hash1.each { |k,v| new_hash[k] = v }
    hash2.each { |k,v| new_hash[k] = v }
    new_hash
end

def censor(sent, arr)
    new_words = sent.split.map do |word|
        if arr.include?(word.downcase)
            rmv_vowels(word)
        else
            word
        end
    end
    new_words.join(" ")
end

def rmv_vowels(word)
    vowels = "aeiouAEIOU"

    new_word = word.split("").map do |char|
        if vowels.include?(char)
            "*"
        else
            char
        end
    end
    new_word.join("")
end

# start going through all the powers of two until we find num
# if we go higher than the num return false
# 
def power_of_two?(num)
    # i = 0
    # power = 2**i

    # while num >= power 
    #     if num == power
    #         return true
    #     else
    #         i += 1  
    #         power = 2**i
    #     end  
    # end
    # false

    (0..num).each do |ele|
        if 2**ele == num
            return true
        end
    end
    false

end