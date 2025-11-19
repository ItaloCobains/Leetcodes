# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
  nums.each do |num|
    idx = num.abs - 1       
    nums[idx] = -nums[idx].abs 
  end
  result = []

  nums.each_with_index do |num, i|
    if num > 0
      result << (i + 1)  
    end
  end

  result
end
