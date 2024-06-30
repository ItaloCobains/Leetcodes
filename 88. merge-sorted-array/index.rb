# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  nums1.slice!(m, nums1.length - m)
  nums2.slice!(n, nums2.length - n)
  nums1.concat(nums2).sort!
end

puts merge([1, 2, 3, 0, 0, 0], 3, [2, 5, 6], 3) # [1, 2, 2, 3, 5, 6]

puts merge([1], 1, [], 0) # [1]

puts merge([0], 0, [1], 1) # [1]
