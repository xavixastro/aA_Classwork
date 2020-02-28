def hipsterfy(word)
    vowels = "aeiou"
    (word.length-1).downto(0) do |idx|
        char = word[idx]
        if vowels.include?(char)
            new_word = word[0...idx] + word[idx+1..-1]
            return new_word
        end
    end
    word
end

def vowel_counts(str)
    count = Hash.new(0)
    vowels = "aeiouAEIOU"
    str.each_char do |char|
        if vowels.include?(char)
            count[char.downcase] += 1
        end
    end
    count
end

def caesar_cipher(str, num)
    new_str = ""
    alpha = ('a'..'z').to_a

    str.each_char.with_index do |char, idx|
        if !alpha.include?(char)
            new_str << char
        else
            current_letter_idx = alpha.index(char)
            cipher_letter = alpha[(current_letter_idx+num)%26]
            new_str << cipher_letter
        end
    end
    new_str

end