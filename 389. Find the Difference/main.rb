# @param {String} s
# @param {String} t
# @return {Character}
def find_the_difference(s, t)
    chars = t.chars.uniq

    chars.each do |char|
        count_s = s.count(char)
        count_t = t.count(char)

        return char if count_t > count_s
    end
end