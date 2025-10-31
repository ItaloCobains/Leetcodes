# The guess API is already defined for you.
# @param num, your guess
# @return -1 if num is higher than the picked number
#          1 if num is lower than the picked number
#          otherwise return 0
# def guess(num)

def guessNumber(n)
    left = 1
    right = n

    while left <= right
        mid = left + (right - left) / 2
        res = guess(mid)

        if res == 0
            return mid
        elsif res < 0
            right = mid - 1
        else
            left = mid + 1
        end
    end
end