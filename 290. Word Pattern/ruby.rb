# @param {String} pattern
# @param {String} s
# @return {Boolean}
def word_pattern(pattern, s)
    words = s.split(' ')
    return false if pattern.length != words.length

    char_to_word = {}
    word_to_char = {}

    pattern.chars.each_with_index do |char, index|
      word = words[index]
      if char_to_word.key?(char)
        return false if char_to_word[char] != word
      else
        char_to_word[char] = word
      end

      if word_to_char.key?(word)
        return false if word_to_char[word] != char
      else
        word_to_char[word] = char
      end
    end

    true
end