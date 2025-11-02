# @param {String} s
# @return {Integer}
def first_uniq_char(s)
    chars = s.chars.uniq

    chars.each do |char|
        count = s.count(char)

        return s.index(char) if count <= 1
    end

    return -1
end