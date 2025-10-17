# @param {Integer} n
# @return {Boolean}
def is_ugly(n)
  return false if n <= 0
  while(n >= 1) do
    return true if n == 1
    if n%2 == 0
      n = n / 2
    elsif n%3 == 0
      n = n / 3
    elsif n%5 == 0
      n = n / 5
    else
      return false
    end
  end
  return true
end
