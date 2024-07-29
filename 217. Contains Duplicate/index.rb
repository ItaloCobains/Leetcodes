
# @param {Integer[]} nums
# @return {Boolean}
def contains_duplicate(nums)
  hash = {}
  nums.each_with_index do |num, index|
    return true if hash[num]
    hash[num] = true
  end

  false
end

puts(contains_duplicate([1,2,3,1]))