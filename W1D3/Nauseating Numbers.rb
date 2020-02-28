# def strange_sums(arr)
#     count = 0
#     arr.each.with_index do |ele1, idx1|
#         arr.each.with_index do |ele2, idx2|
#             count +=1 if idx2 > idx1 && ele1 + ele2 == 0
#         end
#     end
#     count
# end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

# def pair_product(nums, product)
#     nums.each.with_index do |num1, idx1|
#         nums.each.with_index do |num2, idx2|
#             return true if idx2 > idx1 && num1 * num2 == product
#         end
#     end
#     false
# end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

# def rampant_repeats(string, hash)
#     new_string = string.split("").map do |char|
#         if hash.has_key?(char)
#             char * hash[char]
#         else
#             char
#         end
#     end
#     new_string.join("")
# end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

# def perfect_square(num)
#     (1..num).each {|i| return true if i*i == num}
#     false
# end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false


# def anti_prime?(num)
#     count = divisor(num)
#     (1...num).each { |i| return false if count < divisor(i) }
#     true
# end

# def divisor(num)
#     count = 0
#     (1..num).each { |i| count += 1 if num % i == 0 }
#     count
# end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

# def matrix_addition(matrix1, matrix2)
#     main_matrix = Array.new(matrix1.length) { Array.new(matrix1[0].length, 0)}  #2x2 grid
#     matrix1.each.with_index do |sub_arr, idx1| #[2,5]  [4,7]
#         sub_arr.each.with_index do |num, idx2| # 2  5   4   7
#             main_matrix[idx1][idx2] += num
#         end
#     end

#     matrix2.each.with_index do |sub_arr,idx1|
#         sub_arr.each.with_index do |num, idx2| #[9,1], [3,0]]
#             main_matrix[idx1][idx2] += num
#         end
#     end
#     main_matrix
# end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

# def mutual_factors(*nums)
#     num_arr = []
#     count = Hash.new(0)
#     nums.each { |i| num_arr << divisor(i) } #(50, 30) 
#     num_arr.flatten.each { |num| count[num] += 1 }
#     count.select {|k,v| v == nums.length}.keys

# end

# def divisor(num)
#     seq = []
#     (1..num).each {|i| seq << i if num % i == 0}
#     seq
# end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

# def tribonacci_number(n)
#     seq = [1, 1, 2]
#     return 1 if n == 1 || n == 2
#     return 2 if n == 3

#     seq << (seq[-1] + seq[-2] + seq[-3])
#     while seq.length <= n
#         if seq.length == n
#             return seq[-1]
#         else
#             seq << (seq[-1] + seq[-2] + seq[-3])
#         end
#     end
# end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

# def matrix_addition_reloaded(*matrices)
#     first_matrix = matrices[0]  
#     matrices.each { |matrix| return nil if matrix.length != first_matrix.length }
#     main_matrix = Array.new(first_matrix.length) {Array.new(first_matrix[0].length, 0)}

#     first_matrix.each_with_index do |subarr, idx1|
#         subarr.each_with_index do |num, idx2|
#             main_matrix[idx1][idx2] += num
#         end
#     end

#     if matrices.length > 1
#         (1..matrices.length - 1).each do |i|
#             matrices[i].each_with_index do |subArr, idx1|
#                 subArr.each_with_index do |num, idx2|
#                     main_matrix[idx1][idx2] += num
#                 end
#             end
#          end 
#     end
    
#     main_matrix

# end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

# def squarocol?(arr)
    
    
#     arr.each do |subarr|
#         return true if subarr.all? { |ele|  subarr[0] == ele }
#     end

#     (0..arr.length - 1).to_a.any? do |idx1| #refers to column
#         return true if (0..arr.length - 1).to_a.all? do|idx2| #refers to each different row in the column, check ifall rows are the same
#             arr[idx2][idx1] == arr[0][idx1]
#     #         # [0][1] == [0][1]
#     #         # [1][1] == [0][1]
#     #         # [2][1] == [0][1]

#     #         # p squarocol?([
#     #         # [:o, :x , :o],
#     #         # [:x, :x , :x],
#     #         # [:o, :x , :o],


#     #         # return true if arr[idx1][idx2] == arr[0][idx2]
#         end
#     end
#     # row || column
#     false
# end

# p squarocol?([
#     [:a, :x , :d],
#     [:b, :x , :e],
#     [:c, :x , :f],
# ]) # true

# p squarocol?([
#     [:x, :y, :x],
#     [:x, :z, :x],
#     [:o, :o, :o],
# ]) # true

# p squarocol?([
#     [:o, :x , :o],
#     [:x, :o , :x],
#     [:o, :x , :o],
# ]) # false

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 7],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#     [1, 2, 2, 7],
#     [1, 6, 6, 0],
#     [0, 5, 2, 7],
#     [4, 2, 9, 7],
# ]) # false


# def squaragonal?(arr)
#     i = arr.length - 1 
#     j = 0
    
#     return true if (0..arr.length-1).to_a.all? do |idx1| 
#             arr[idx1][idx1] == arr[(idx1+1)%arr.length][(idx1+1)%arr.length]
#     end

#     while i >= 0
#         return false if arr[j][i] != arr[0][arr.length-1]
#         i-=1
#         j+=1
#      end
#      true

#      # return true if (0..arr.length-1).to_a.all? do |idx1|
#     #     (0..arr.length-1).to_a.reverse.each do |idx2|
#     #         arr[idx1][idx2] == arr[(idx1+1)%arr.length][(idx2-1)%arr.length]
#     #     end
#     # end
#     # false
# end

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false

# def pascals_triangle(n)
#     pyramid = [[1], [1,1]]
#     while pyramid.length < n
#         new_lvl = [1]
#         base = pyramid[-1]


#         (0...base.length-1).each do |idx|
#             new_lvl << base[idx] + base[idx+1] #2
#         end

#         new_lvl << 1
#         pyramid << new_lvl

#     end
#     pyramid
# end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]



# def mersenne_prime(n)
#     # arr = power_of_two?
#     # new_arr = arr.select {|i| primes?(i)}
#     # new_arr[n-1]
#     new_arr = []
#     i = 0
#     while new_arr.length < n
#         new_arr << (2**i) - 1 if primes?((2**i)-1)
#         i+=1
#     end
#     new_arr[n-1]
# end

# # def power_of_two?
# #     seq = []
# #     (0..20).each do |ele|
# #         seq << (2**ele)-1
# #     end
# #     seq
# # end

# def primes?(num)
#     return false if num < 2
#     (2...num).each {|i| return false if num % i == 0}
#     true
# end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

# def triangular_word?(word)
#     num_word = encode(word)
#     (1..num_word).each { |i| return true if (i * (i + 1)) / 2 == num_word }
#     false
# end

# def encode(word)
#     alpha = "abcdefghijklmnopqrstuvwxyz"
#     total = 0
#     word.each_char { |char| total += alpha.index(char) + 1 }
#     total
# end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

# require "byebug"

# def consecutive_collapse(arr)
#     collapse = false

#     while !collapse
#         collapse = true
#         i = 0
#         while i < arr.length    
#             lower = arr[i] - 1    
#             higher = arr[i] + 1
#             if arr[i+1] == lower || arr[i+1] == higher
#                 arr[i] = ""
#                 arr[i+1] = ""
#                 arr.select! { |ele| ele.class == Integer} 
#                 i = 0
#                 collapse = false
#             else
#                 i += 1
#             end
#         end
#     end
#     arr
# end
# # debugger
# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

def pretentious_primes(arr, n)
    # debugger
    new_arr = arr.map do |el|
        if n > 0 
            num = el
            n.times{num = next_prime(num) }
            num
        else
            num = el
            n.abs.times {num = prev_prime(num) }
            num
        end
    end
    new_arr
end

def is_prime?(num)
    return false if num < 2
    (2...num).none?{|div| num % div == 0}
end

def next_prime(num)
    next_num = num + 1
    until is_prime?(next_num)
        next_num += 1
    end
    next_num
end

def prev_prime(num)
    return nil if num.nil?
    prev_num = num-1
    while prev_num >= 2
        return prev_num if is_prime?(prev_num)
        prev_num -= 1
    end
    nil
end

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]
