# @param {String} word
# @return {Integer}
def wonderful_substrings(word)
  count = 0
  (0...word.length).each do |i|
    (i...word.length).each do |j|
      count += 1 if wonderful?(word[i..j])
    end
  end
  count
end

def wonderful?(word)
  word.chars.uniq.count { |char| word.count(char).odd? } <= 1
end

p wonderful_substrings("aba") # 4
p wonderful_substrings("aabb") # 9
p wonderful_substrings("he") # 2
