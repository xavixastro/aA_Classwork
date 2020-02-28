def proper_factors(num)
    factors = []
    (1...num).each do |div|
        factors << div if num % div == 0
    end
    factors
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number?(num)
    aliquot_sum(num) == num
end

def ideal_numbers(num)
    results = []
    i = 1
    while results.length < num
        results << i if perfect_number?(i)
        i += 1
    end
    results
end