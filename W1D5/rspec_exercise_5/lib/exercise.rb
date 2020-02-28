 require "byebug"
 def zip(*matrices)
    width = matrices[0].length
    length = matrices.length
    new_matrix = Array.new(width) {Array.new(length)}

    matrices.each_with_index do |subArr, i1| 
        subArr.each_with_index do |el, i2| 
            new_matrix[i2][i1] = el
        end
    end
    new_matrix
 end

# Another easier solution:
#  def zip(*matrices)
#     matrices.transpose
#  end

#-------------------------

def prizz_proc(arr, prc1, prc2)
    arr.select do |el|
        prc1.call(el) != prc2.call(el)
    end
end

#-------------------------

def zany_zip(*arrays) 
#debugger
    length = arrays.inject(0) do |acc, el| 
        if el.length > acc 
            el.length
        else
            acc
        end
    end
    width = arrays.length
    new_arr = Array.new(length) { Array.new(width, nil) }

    arrays.each_with_index do |subArr, i1|
        subArr.each_with_index do |el, i2|
            new_arr[i2][i1] = el
        end
    end
    new_arr
end

#-------------------------

def maximum(arr, &prc)
    return nil if arr.length == 0

    arr.inject do |acc, el| 
        if prc.call(el) >= prc.call(acc)
            el 
        else
            acc
        end
    end
    
end

#-------------------------

def my_group_by(arr, &prc)
    hash = Hash.new { |h, k| h[k]=[] } 

    arr.each do |el|
        result = prc.call(el)
        hash[result] << el
    end

    hash
end

#-------------------------

def max_tie_breaker(arr, prc, &block)
    return nil if arr.empty?

    hash = Hash.new { |h, k| h[k]=[] }
    arr.each do |el| # Fills the hash
        result = block.call(el)
        hash[result] << el
    end

    sorted = hash.sort_by { |k, v| k } # 2D array of sorted hash [[k, v],[k,v]]
    arr2 = sorted[-1][-1] # Array of values from last key

    return arr2[0] if arr2.length == 1 # If there is no tie, return the element

    # If there is a tie
    arr2.inject do |acc, el| # If there is still a tie, the acc never changes 
        if prc.call(el) > prc.call(acc)
            el
        else
            acc
        end
    end
  
end

#-------------------------

def silly_syllables(sentence)
    words = sentence.split

    modified_words = words.map do |word|
        remove_vowels(word)
    end

    modified_words.join(" ")
end

def remove_vowels(word) # Helper method
    vowels = "aeiouAEIOU"

    indices = []
    word.each_char.with_index do |char, x|
        indices << x if vowels.include?(char)
    end

    return word if indices.length < 2

    first_vowel = indices[0]
    last_vowel = indices[-1]
    word[first_vowel..last_vowel] # Returns modified word
end