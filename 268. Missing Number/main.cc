#include <vector>
#include <iostream>
#include <numeric>

using namespace std;

class Solution {
public:
  // Could you implement a solution using only O(1) extra space complexity and O(n) runtime complexity?
  int missingNumber(vector<int>& nums) {
    int n = nums.size();
    int expected_sum = n * (n + 1) / 2;
    int actual_sum = accumulate(nums.begin(), nums.end(), 0);
    return expected_sum - actual_sum;
  }
};

int main() {
  Solution solution;

  vector<int> nums1 = {3, 0, 1};
  vector<int> nums2 = {0, 1};
  vector<int> nums3 = {9,6,4,2,3,5,7,0,1};

  int result1 = solution.missingNumber(nums1); // Expected output: 2
  int result2 = solution.missingNumber(nums2); // Expected output: 2
  int result3 = solution.missingNumber(nums3); // Expected output: 8

  printf("Missing number in nums1: %d\n", result1);
  printf("Missing number in nums2: %d\n", result2);
  printf("Missing number in nums3: %d\n", result3);
  return 0;
}