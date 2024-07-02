# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
  # Create a hash to store the count of each number in nums1
  # Create an empty array to store the result
  # Iterate through nums1
  # If the number is not in the hash, add it with a count of 1
  # If the number is in the hash, increment the count
  # Iterate through nums2
  # If the number is in the hash and the count is greater than 0
  # Add the number to the result array
  # Decrement the count
  # Return the result array
  hash = {}
  result = []
  nums1.each do |num|
    if hash[num]
      hash[num] += 1
    else
      hash[num] = 1
    end
  end

  nums2.each do |num|
    if hash[num] && hash[num] > 0
      result.push(num)
      hash[num] -= 1
    end
  end

  result
end

puts intersect([1,2,2,1], [2,2]) # [2,2]

puts intersect([4,9,5], [9,4,9,8,4]) # [4,9]
