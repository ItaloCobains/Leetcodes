# @param {Integer[]} nums
# @param {Integer} val
# @return {Integer}
def remove_element(nums, val)
  nums.delete(val)
  nums.length
end

p remove_element([3,2,2,3], 3) # 2
p remove_element([0,1,2,2,3,0,4,2], 2) # 5
p remove_element([1], 1) # 0
