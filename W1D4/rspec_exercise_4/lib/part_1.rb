def my_reject(arr, &my_block)
    results = []
    arr.each{|el| results << el if !my_block.call(el)}
    results
end

def my_one?(arr, &my_block)
    results = []
    arr.each {|ele| results << my_block.call(ele)}
    results.count{|el| el} == 1
end

def hash_select(hash, &prc)
    new_hash = {}
    hash.each do |k, v|
        new_hash[k] = v if prc.call(k, v)
    end
    new_hash
end

def xor_select(arr, prc1, prc2)
    results = []
    arr.each do |el|
        if prc1.call(el) && !prc2.call(el)
            results << el
        elsif !prc1.call(el) && prc2.call(el)
            results << el
        end
    end
    results
end

def proc_count(val, prcs)
    counter = 0
    prcs.each do |prc|
        counter += 1 if prc.call(val) 
    end
    counter
end