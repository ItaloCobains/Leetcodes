# @param {String} s
# @return {String}
def longest_palindrome(s)
  return s if s.length <= 1

  longest = s[0]
  for i in 0..s.length - 1
    # odd
    left = i
    right = i
    while left >= 0 && right < s.length && s[left] == s[right]
      left -= 1
      right += 1
    end
    longest = s[left + 1..right - 1] if right - left - 1 > longest.length

    # even
    left = i
    right = i + 1
    while left >= 0 && right < s.length && s[left] == s[right]
      left -= 1
      right += 1
    end
    longest = s[left + 1..right - 1] if right - left - 1 > longest.length
  end

  longest
end

p longest_palindrome("babad") # "bab"

p longest_palindrome("cbbd") # "bb"

p longest_palindrome("a") # "a"
