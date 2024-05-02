# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  return 0 if s.empty?

  hash = {}
  max = 0
  s.chars.each_with_index do |char, index|
    if hash[char]
      max = [max, hash.size].max
      hash = {}
    end

    hash[char] = index

    if index == s.size - 1
      max = [max, hash.size].max
    end
  end

  max
end

p length_of_longest_substring("abcabcbb") # 3

p length_of_longest_substring("bbbbb") # 1

p length_of_longest_substring("pwwkew") # 3

p length_of_longest_substring("") # 0

p length_of_longest_substring("dvdf") # 3
