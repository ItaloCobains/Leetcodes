class Solution {
    fun thirdMax(nums: IntArray): Int {
        var first: Long = Long.MIN_VALUE
        var second: Long = Long.MIN_VALUE
        var third: Long = Long.MIN_VALUE

        for (n in nums) {
            val num = n.toLong()
            if (num == first || num == second || num == third) continue

            when {
                num > first -> {
                    third = second
                    second = first
                    first = num
                }
                num > second -> {
                    third = second
                    second = num
                }
                num > third -> {
                    third = num
                }
            }
        }

        return if (third == Long.MIN_VALUE) first.toInt() else third.toInt()
    }
}