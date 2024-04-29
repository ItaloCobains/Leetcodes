# @param {String} s
# @return {Integer}
def roman_to_int(s)
  roman_to_int_hash = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }

  result = 0

  s.each_char.with_index do |char, index|
    if index < s.length - 1
      if roman_to_int_hash[char] < roman_to_int_hash[s[index + 1]]
        result -= roman_to_int_hash[char]
      else
        result += roman_to_int_hash[char]
      end
    else
      result += roman_to_int_hash[char]
    end
  end

  result
end

p roman_to_int("III") # 3
p roman_to_int("IV") # 4
p roman_to_int("IX") # 9
p roman_to_int("LVIII") # 58
p roman_to_int("MCMXCIV") # 1994
p roman_to_int("MMMCMXCIV") # 3994
p roman_to_int("MMMCMXCIV") # 3994
p roman_to_int("MMMCMXCIV") # 3994
p roman_to_int("MMMCMXCIV") # 3994
