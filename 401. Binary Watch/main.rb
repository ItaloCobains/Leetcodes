# Input: turnedOn = 1
# Output: ["0:01","0:02","0:04","0:08","0:16","0:32","1:00","2:00","4:00","8:00"]


# @param {Integer} turned_on
# @return {String[]}
def read_binary_watch(turned_on)
  hours = [1, 2, 4, 8]
  minutes = [1, 2, 4, 8, 16, 32]
  result = []

  (0..turned_on).each do |h_count|
    m_count = turned_on - h_count
    next if h_count > hours.size || m_count > minutes.size

    hours.combination(h_count).each do |h_comb|
      hour = h_comb.sum
      next if hour >= 12

      minutes.combination(m_count).each do |m_comb|
        minute = m_comb.sum
        next if minute >= 60

        result << format("%d:%02d", hour, minute)
      end
    end
  end

  result
end