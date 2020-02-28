def select_even_nums(arr)
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(arr)
    arr.count do |subarr|
        subarr.sum > 0
    end
end

def aba_translate(str)
    vowels = "aeiou"
    chars = str.split("")
    chars.map do |char|
        if vowels.include?(char)
            char + "b" + char
        else
            char
        end
    end.join("")
end

def aba_array(arr)
    arr.map{|word| aba_translate(word)}
end
