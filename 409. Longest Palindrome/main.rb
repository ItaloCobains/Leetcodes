# @param {String} s
# @return {Integer}
def longest_palindrome(s)
  counts = Hash.new(0)
  s.each_char { |ch| counts[ch] += 1 }

  length = 0
  odd_found = false

  counts.each_value do |count|
    length += (count / 2) * 2
    odd_found ||= count.odd?
  end

  length += 1 if odd_found && length < s.length
  length
end
