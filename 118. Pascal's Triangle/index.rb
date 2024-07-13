# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
  return [] if num_rows == 0
  return [[1]] if num_rows == 1

  result = [[1], [1, 1]]

  3.upto(num_rows) do |i|
    row = [1]
    (1..i-2).each do |j|
      row << result[i-2][j-1] + result[i-2][j]
    end
    row << 1
    result << row
  end

  result
end

# Time is O(n^2) where n is the number of rows

puts generate(5) == [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
