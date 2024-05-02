# Dadas duas matrizes classificadas nums1e nums2de tamanho me nrespectivamente, retorne a mediana das duas matrizes classificadas.

# A complexidade geral do tempo de execução deve ser O(log (m+n)).

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  nums = (nums1 + nums2).sort
  size = nums.size
  return nums[size / 2].to_f if size.odd?

  (nums[size / 2] + nums[size / 2 - 1]) / 2.0
end

p find_median_sorted_arrays([1, 3], [2]) # 2.0

p find_median_sorted_arrays([1, 2], [3, 4]) # 2.5

p find_median_sorted_arrays([0, 0], [0, 0]) # 0.0
