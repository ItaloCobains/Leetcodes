def two_sum(nums, target)
  hash = {}
  result = []
  nums.each_with_index do |num, index|
    if hash[target - num]
      result << hash[target - num]
      result << index
    end

    hash[num] = index
  end

  result
end

puts two_sum([3,2,4], 6)
