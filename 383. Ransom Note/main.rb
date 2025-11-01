# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
    cache = magazine.chars.each_with_object({}) do |char, hash|
        hash[char] = (hash[char] || 0) + 1
    end

    ransom_note.each_char do |char|
        quantidade = cache[char]

        return false if quantidade.nil? || quantidade < 1

        cache[char] = quantidade - 1
    end

    return true
end
