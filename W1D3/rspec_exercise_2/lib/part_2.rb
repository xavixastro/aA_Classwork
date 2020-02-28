def palindrome?(str)
    str_rvs = ""
    i = str.length-1
    while 0 <= i  
        str_rvs += str[i]
        i -= 1
    end
    str == str_rvs
end

def substrings(str)
    
    subs = []
    (0..str.length-1).each do |idx1|
        (0..str.length-1).each do |idx2|
            if idx2 >= idx1
                subs << str[idx1..idx2]
            end
        end
    end
    subs

end

def palindrome_substrings(str)
    substring_arr = substrings(str)
    substring_arr.select { |letters| letters.length > 1 && palindrome?(letters)}
end