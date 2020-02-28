def element_count(arr)
    arr_elem = arr.uniq
    results = {}
    arr_elem.each do |ele|
        counter = 0
        arr.each do |sub_ele|
            counter += 1 if sub_ele == ele 
        end
        results[ele] = counter
    end
    results 
end

def char_replace!(str, hash)
    (0...str.length).each do |i|
        if hash.has_key?(str[i])
            str[i] = hash[str[i]]
        end
    end
    str
    # str.split("").map do |char|
    #     if hash.has_key?(char)
    #         hash[char]
    #     else 
    #         char
    #     end
    # end.join("")

end

def product_inject(arr)
    arr.inject {|acc, el| acc * el}
end

