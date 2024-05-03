# @param {String} version1
# @param {String} version2
# @return {Integer}
def compare_version(version1, version2)
  version1 = version1.split('.').map(&:to_i)
  version2 = version2.split('.').map(&:to_i)

  while version1.length < version2.length
    version1.push(0)
  end

  while version2.length < version1.length
    version2.push(0)
  end

  version1.each_with_index do |v1, i|
    v2 = version2[i]

    if v1 > v2
      return 1
    elsif v1 < v2
      return -1
    end
  end

  0
end

p compare_version("0.1", "1.1") # -1

p compare_version("1.0.1", "1") # 1

p compare_version("1.0.1", "1.0.1") # 0
