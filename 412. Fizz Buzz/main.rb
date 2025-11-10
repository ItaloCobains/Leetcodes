# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  (1..n).each_with_object(Array.new) do |i, ob|
    ob << "FizzBuzz" and next if i % 3 == 0 && i % 5 == 0
    ob << "Fizz" and next if i % 3 == 0
    ob << "Buzz" and next if i % 5 == 0
    ob << i.to_s
  end
end