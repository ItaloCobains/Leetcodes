VOLWERS = [
    'a',
    'e',
    'i',
    'o',
    'u'
]

# @param {String} s
# @return {String}
def reverse_vowels(s)
    char_volwers = []
    index_volwers = []

    s.each_char.with_index do |char, index|
        if VOLWERS.include?(char.downcase)
            char_volwers.push char
            index_volwers.push index
        end
    end

    index_volwers.each do |index|
        s[index] = char_volwers.pop
    end

    return s
end