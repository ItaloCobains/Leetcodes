# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  max_profit = 0
  min_price = Float::INFINITY

  prices.each do |price|
    min_price = [min_price, price].min
    profit = price - min_price
    max_profit = [max_profit, profit].max
  end

  max_profit
end

puts max_profit([7,1,5,3,6,4]) # 5
puts max_profit([7,6,4,3,1]) # 0
