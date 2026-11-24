def find(nums, target, first)
  left = 0
  right = nums.length - 1
  ans = -1

  while left <= right
    mid = (left + right) >> 1 # bitwise right shift operator to divide by 2

    if nums[mid] == target
      ans = mid
      if first
        right = mid - 1
      else
        left = mid + 1
      end
    elsif nums[mid] < target
      left = mid + 1
    else
      right = mid - 1
    end
  end

  return ans
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  return [find(nums, target, true), find(nums, target, false)]
end
