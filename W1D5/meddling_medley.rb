require "byebug"
puts "Phase 1:"

def duos(word)
    counter = 0
    (0...word.length-1).each do |idx|
        counter += 1 if word[idx] == word[idx+1]
    end
    counter
end

p duos('bootcamp')      # 1
p duos('wxxyzz')        # 2
p duos('hoooraay')      # 3
p duos('dinosaurs')     # 0
p duos('e')             # 0

puts "----------------------"

#----------------------

def sentence_swap(sentence, hash)
    sent_arr = sentence.split.map do |word|
        if hash.has_key?(word)
            hash[word]
        else
            word
        end
    end

    sent_arr.join(" ")
end

p sentence_swap('anything you can do I can do',
    'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
) # 'nothing you shall drink I shall drink'

p sentence_swap('what a sad ad',
    'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
) # 'make a happy ad'

p sentence_swap('keep coding okay',
    'coding'=>'running', 'kay'=>'pen'
) # 'keep running okay'

puts "----------------------"

#----------------------

def hash_mapped(hash, proc, &block)
    new_hash = {}
    hash.each do |k,v|
        new_hash[block.call(k)] = proc.call(v)
    end
    new_hash
end

double = Proc.new { |n| n * 2 }
p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

first = Proc.new { |a| a[0] }
p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# {25=>"q", 36=>"w"}

puts "----------------------"

#----------------------

def counted_characters(str)
    hash = Hash.new(0)
    str.each_char do |char|
        hash[char] += 1
    end
    new_arr = []
    hash.each do |k,v|
        new_arr << k if v > 2       
    end
    new_arr
end

p counted_characters("that's alright folks") # ["t"]
p counted_characters("mississippi") # ["i", "s"]
p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
p counted_characters("runtime") # []

puts "----------------------"

#----------------------

def triplet_true(str)
    (0...str.length-2).each do |i|
        return true if str[i] == str[i+1] && str[i+1] == str[i+2]     
    end
    false
end


p triplet_true('caaabb')        # true
p triplet_true('terrrrrible')   # true
p triplet_true('runninggg')     # true
p triplet_true('bootcamp')      # false
p triplet_true('e')             # false

puts "----------------------"

#----------------------

def energetic_encoding(str, hash)
    new_str = ""
    str.each_char do |char|
        if hash.has_key?(char)
            new_str += hash[char]
        elsif char == " "
            new_str += char
        else
            new_str += "?"
        end
    end
    new_str
end

p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????'

puts "----------------------"

#----------------------

def uncompress(str)
    new_str = ""
    (0...str.length-1).each do |idx|
        new_str += str[idx] * str[idx+1].to_i
    end
    p new_str
end

uncompress('a2b4c1') # 'aabbbbc'
uncompress('b1o2t1') # 'boot'
uncompress('x3y1x2z4') # 'xxxyxxzzzz'

puts "----------------------"

#----------------------
puts "Phase 2:"

def conjunct_select(arr, *prcs)
    new_arr = []
    arr.each do |el|
        new_arr << el if prcs.all? { |prc| prc.call(el) }
    end
    new_arr
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

puts "----------------------"

#----------------------

def convert_pig_latin(str)
# debugger
    words = []
    str.split.each do |word|
        if word.length >= 3
            if word == word.capitalize   
                words << translate(word).capitalize 
            else 
                words << translate(word) 
            end
        else   
            words << word
        end
    end
    words_str = words.join(" ")
    words_str[0].upcase!
    words_str
end

def translate(word)
    vowels = "aeiouAEIOU"
    if vowels.include?(word[0])
        return word + "yay"
    else 
        word.each_char.with_index do |char, idx|
            if vowels.include?(char)
                return word[idx..-1] + word[0...idx] + "ay"
            end
        end 
    end
end

p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

puts "----------------------"

#----------------------

def reverberate(str)
    words = []
    str.split.each do |word|
        if word.length < 3
            words << word
        else
            words << mutate(word)
        end 
    end
    words.join(" ")
end

def mutate(word)
    vowels = "aeiouAEIOU"
    if vowels.include?(word[-1])
        return word + word.downcase
    end
    i = word.length - 1
    while i >= 0
        if vowels.include?(word[i])
            return word + word[i..-1]
        end
        i -= 1
    end
end

p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

puts "----------------------"

#----------------------

def disjunct_select(arr, *prcs)
    new_arr = []
    arr.each do |ele|
        new_arr << ele if prcs.any? { |prc| prc.call(ele) }  
    end
    new_arr
end

longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
) # ["apple", "teeming"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o
) # ["dog", "apple", "teeming", "boot"]

p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
    longer_four,
    contains_o,
    starts_a
) # ["ace", "dog", "apple", "teeming", "boot"]

puts "----------------------"

#----------------------

def alternating_vowel(sentence)
    words = sentence.split
    words.map.with_index do |word, idx|
        if idx.even? 
            remove_first_vowel(word)
        else   
            remove_last_vowel(word)
        end
    end.join(" ")
end

def remove_first_vowel(word)
    vowels = "aeiouAEIOU"
    (0...word.length).each do |idx|
        return word[0...idx] + word[idx+1..-1] if vowels.include?(word[idx])
    end
    word
end

def remove_last_vowel(word)
    vowels = "aeiouAEIOU"
    (word.length-1).downto(0).each do |idx|
        return word[0...idx] + word[idx+1..-1] if vowels.include?(word[idx])
    end
    word
end

p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
p alternating_vowel('code properly please') # "cde proprly plase"
p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

puts "----------------------"

#----------------------

def silly_talk(sentence)
    words = sentence.split
    words.map do |word|
        modify(word)
    end.join(" ")
end

def modify(word)
    vowels = "aeiouAEIOU"
    return word + word[-1] if vowels.include?(word[-1])
    new_word = ""
    word.each_char do |char| 
        if vowels.include?(char)
            new_word += char + "b" + char.downcase
        else   
            new_word += char
        end
    end
    new_word
end

p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
p silly_talk('They can code') # "Thebey caban codee"
p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

puts "----------------------"

#----------------------

# Review
def compress(str)
    new_str = ""
    i = 0
    while i < str.length
        counter = 0
        current_char = str[i] # 'b'
        new_str += current_char
        # nested loop to get counter
        while current_char == str[i]
            counter += 1
            i += 1
        end
        new_str += counter.to_s if counter != 1
    end
    new_str
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"