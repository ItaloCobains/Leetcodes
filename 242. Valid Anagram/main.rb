# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  cache = Hash.new

  s.each_char do |char|
    tmp = cache[:"#{char}"]
    if tmp
      cache[:"#{char}"] = cache[:"#{char}"] + 1 
    else
      cache[:"#{char}"] = 1
    end
  end

  t.each_char do |char|
    tmp = cache[:"#{char}"]

    if tmp && tmp > 1
      cache[:"#{char}"] = tmp - 1
    elsif tmp 
      cache.delete(:"#{char}")
    else
      return false
    end
  end

  return cache.empty?
end
