# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  return 0 if needle.empty?
  return -1 if haystack.empty? || haystack.length < needle.length

  (0..haystack.length - needle.length).each do |i|
    return i if haystack[i, needle.length] == needle
  end

  -1
end


p str_str("hello", "ll") # 2
p str_str("aaaaa", "bba") # -1
p str_str("", "") # 0
p str_str("a", "") # 0
p str_str("", "a") # -1
