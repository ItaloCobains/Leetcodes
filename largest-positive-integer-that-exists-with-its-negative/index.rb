# Dado um array de inteiros numsque não contém zeros, encontre o maior número inteiro positivok que -ktambém existe no array.

# Retorne o número inteiro positivok . Se não existir tal número inteiro, retorne -1.

# @param {Integer[]} nums
# @return {Integer}
def find_max_k(nums)
  max = -1
  nums.each do |num|
    max = num if num > max && nums.include?(num * -1)
  end
  max
end

p find_max_k([-1, 2, -3, 3]) # 3
p find_max_k([-1,10,6,7,-7,1]) # 7
p find_max_k([-10,8,6,7,-2,-3]) # -1
