# @param {Integer[]} arr
# @return {Boolean}
def three_consecutive_odds(arr)
  # interate through the array
  # check if the current number is odd
  # if it is, check if the next two numbers are odd
  # if they are, return true
  # if we reach the end of the array, return false
  return false if arr.length < 3
  (0..arr.length - 3).each do |i|
    return true if arr[i].odd? && arr[i + 1].odd? && arr[i + 2].odd?
  end
  false
end

puts three_consecutive_odds([1,2,34,3,4,5,7,23,12])

puts three_consecutive_odds([2,6,4,1])
