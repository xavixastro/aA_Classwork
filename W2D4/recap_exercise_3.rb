require "byebug"
def no_dupes?(array)

    hash = Hash.new(0)
    array.each {|el| hash[el] += 1}
    hash.select {|k,v| v < 2}.keys

end

# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(['x', 'x', 'y', 'z', 'z'])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(array)
    (0...array.length - 1).each do |i|
        return false if array[i] == array[i+1]
    end
    true
end

# p no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])     # => true
# p no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(['x'])                              # => true

def char_indices(str)
    hash = Hash.new { |h,k| h[k] = [] }
    str.each_char.with_index { |char,i| hash[char] << i }
    hash
end

# p char_indices('mississippi')   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices('classroom')     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}


def longest_streak(str)
    longest = ""
    i = 0
    while i < str.length
        streak = str[i]
        counter = 0

        while str[i] == streak
            counter += 1
            i += 1
        end

        longest = streak * counter if counter > longest.length
    end
    longest
end

# p longest_streak('a')           # => 'a'
# p longest_streak('accccbbb')    # => 'cccc'
# p longest_streak('aaaxyyyyyzz') # => 'yyyyy
# p longest_streak('aaabbb')      # => 'bbb'
# p longest_streak('abc')         # => 'c'

def bi_prime?(num)
    primes = []
    (1..num).each {|i| primes << i if prime?(i)}
    (0...primes.length).each do |idx1|
        (0...primes.length).each do |idx2|
            return true if idx2 >= idx1 && primes[idx1] * primes[idx2] == num
        end
    end
    false
end

def prime?(num)
    return false if num < 2
    (2...num).none?{|i| num % i == 0}
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(str,keys)
    alpha = ("a".."z").to_a
    new_str = ""

    str.each_char.with_index do |char,idx|
        old_pos = alpha.index(char)
        new_pos = old_pos + keys[idx % keys.length]
        new_str += alpha[new_pos % alpha.length]
    end

    new_str

end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

# Message:  b a n a n a s i n p a j a m a s
# Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# Result:   c c q b p d t k q q c m b o d t

def vowel_rotate(str)
    vowels = "aeiou"
    new_str = ""
    indices = []

    str.each_char { |char| indices << char if vowels.include?(char) }
    rotated = indices.rotate(-1)
    str.each_char.with_index do |c,i|
        if !vowels.include?(c)
            new_str += c
        else
            new_str += rotated.shift
        end
    end

    new_str
    # indices = []
    # vowels = "aeiou"
    # (0...str.length).each { |i| indices << i if vowels.include?(str[i]) }
    # debugger
    # indices.each_with_index do |vowel_idx, idx|
    #     prev = indices[-1 - idx] 
    #     str[vowel_idx] = str[prev]
    # end
    # str
end

# p vowel_rotate('computer')      # => "cempotur"
# p vowel_rotate('oranges')       # => "erongas"
# p vowel_rotate('headphones')    # => "heedphanos"
# p vowel_rotate('bootcamp')      # => "baotcomp"
# p vowel_rotate('awesome')       # => "ewasemo"

# Proc Problems

class String

    def select(&prc)
        return "" if prc.nil?
        new_str = ""
        self.each_char {|char| new_str += char if prc.call(char)}
        new_str
    end

    def map!(&prc)
        self.each_char.with_index { |char, idx| self[idx] = prc.call(char,idx) }
    end

end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

word_1 = "Lovelace"
word_1.map! do |ch| 
    if ch == 'e'
        '3'
    elsif ch == 'a'
        '4'
    else
        ch
    end
end
# p word_1        # => "Lov3l4c3"

word_2 = "Dijkstra"
word_2.map! do |ch, i|
    if i.even?
        ch.upcase
    else
        ch.downcase
    end
end
# p word_2        # => "DiJkStRa"

def multiply(a,b)


    # return 0 if b == 0 

    # if b < 0 && a > 0
    #     a,b = b,a
    # elsif b < 0 && a < 0
    #     a,b = -a,-b
    # end

    # return a + multiply(a, b-1)

    return 0 if b == 0
    if b < 0
        -(a + multiply(a, (-b) - 1) )
    else
        a + multiply(a, b - 1 )
    end

end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18

def lucas_sequence(length)
    return [] if length == 0
    return [2] if length == 1
    return [2,1] if length == 2

    seq = lucas_sequence(length - 1)
        seq << seq[-1] + seq[-2]
    return seq
end

# p lucas_sequence(0)   # => []
# p lucas_sequence(1)   # => [2]    
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
    primes = [] 
     i = 2 
    while num != 1
        while num % i == 0
            if is_prime?(i) 
                num = num / i 
                primes << i 
            else
                i += 1 
            end  
        end
        i += 1 
    end
    primes
end

def is_prime?(n)
    return false if n < 2
    (2...n).none?{|div| n % div == 0}
end

p prime_factorization(12)     # => [2, 2, 3]
p prime_factorization(24)     # => [2, 2, 2, 3]
p prime_factorization(25)     # => [5, 5]
p prime_factorization(60)     # => [2, 2, 3, 5]
p prime_factorization(7)      # => [7]
p prime_factorization(11)     # => [11]
p prime_factorization(2017)   # => [2017]