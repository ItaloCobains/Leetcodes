# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
    n > 0 && (n & (n - 1)) == 0
end

# Time complexity: O(1)
# Space complexity: O(1)

is_power_of_two(1) # true
is_power_of_two(16) # true
