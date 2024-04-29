# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x.negative?

  x.to_s == x.to_s.reverse
end

p is_palindrome(121) # true
p is_palindrome(-121) # false
