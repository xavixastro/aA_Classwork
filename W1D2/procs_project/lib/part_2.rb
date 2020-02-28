def reverser(str, &prc)
    prc.call(str.reverse)
end

def word_changer(str, &prc)
    str.split(" ").map{|word| prc.call(word)}.join(" ")
end

def greater_proc_value(num, prc1, prc2)
    prc1.call(num) > prc2.call(num) ? prc1.call(num) : prc2.call(num)
end

def and_selector(arr, prc1, prc2)
    new_arr = []
    arr.each {|el| new_arr << el if prc1.call(el) && prc2.call(el)}
    new_arr
end

def alternating_mapper(arr, prc1, prc2)
    new_arr = []
    arr.each_with_index { |el,idx| idx.even? ? new_arr << prc1.call(el) : new_arr << prc2.call(el) }
    new_arr
end