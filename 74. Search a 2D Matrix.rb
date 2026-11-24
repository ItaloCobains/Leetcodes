# @param {Integer[][]} matrix
# @param {Integer} target
# @return {Boolean}
def search_matrix(matrix, target)
  return false if matrix.empty? || matrix[0].empty?

  rows = matrix.length
  cols = matrix[0].length

  while rows > 0 && cols > 0
    mid_row = rows >> 1 # bitwise right shift operator to divide by 2
    left = 0
    right = cols - 1

    while left <= right
      mid_col = (left + right) >> 1 # bitwise right shift operator to divide by 2

      if matrix[mid_row][mid_col] == target
        return true
      elsif matrix[mid_row][mid_col] < target
        left = mid_col + 1
      else
        right = mid_col - 1
      end
    end
  end
end