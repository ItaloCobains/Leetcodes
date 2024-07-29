# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  hash = {}
  nums.each_with_index do |num, index|
    return true if hash[num] && index - hash[num] <= k
    hash[num] = index
  end

  false
end

puts(contains_nearby_duplicate([1,2,3,1], 3)) # true