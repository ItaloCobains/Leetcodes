require 'debug'

# @param {Integer[]} nums
# @return {Integer}
def min_difference(nums)
  binding.break
  return 0 if nums.length <= 4
  nums.sort!
  min = Float::INFINITY
  (0..3).each do |i|
    min = [min, nums[nums.length - 4 + i] - nums[i]].min
  end
  min
end

puts min_difference([5,3,2,4]) # 0

puts min_difference([1,5,0,10,14]) # 1

puts min_difference([6,6,0,1,1,4,6]) # 4