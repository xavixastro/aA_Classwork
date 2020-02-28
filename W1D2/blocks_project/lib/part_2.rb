def all_words_capitalized?(arr)
    arr.all?{|word| word == word.capitalize}
end

def no_valid_url?(arr)
    arr.none? { |url| ['.com', '.net', '.io', '.org'].include?(url[-4..-1]) }
end

def any_passing_students?(arr)
    arr.any? do |student|
        student[:grades].sum / student[:grades].length >= 75 
    end
end