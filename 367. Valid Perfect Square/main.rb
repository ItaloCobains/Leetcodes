# @param {Integer} num
# @return {Boolean}
def is_perfect_square(num)
  return false if num < 0
  raiz = Math.sqrt(num).to_i
  return raiz * raiz == num 
end