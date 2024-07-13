# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  # Remove all non-alphanumeric characters
  # Convert the string to lowercase
  # Reverse the string
  # Compare the reversed string with the original string

  s = s.gsub(/[^0-9a-z]/i, "").downcase
  s == s.reverse
end

puts is_palindrome("A man, a plan, a canal: Panama") # true
puts is_palindrome("race a car") # false
puts is_palindrome(" ") # true
