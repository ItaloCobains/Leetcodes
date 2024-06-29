# @param {Integer} n
# @return {Integer}
def climb_stairs(n)
  return n if n <= 2
  dp = Array.new(n + 1, 0)
  dp[1] = 1
  dp[2] = 2
  (3..n).each do |i|
    dp[i] = dp[i - 1] + dp[i - 2]
  end
  dp[n]
end

puts climb_stairs(2) # 2
puts climb_stairs(3) # 3
puts climb_stairs(4) # 5
