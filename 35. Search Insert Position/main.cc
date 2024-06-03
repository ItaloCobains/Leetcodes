#include <iostream>
#include <vector>

using namespace std;

class Solution {
public:
    int searchInsert(vector<int>& nums, int target) {
        int left = 0, right = nums.size();
        while(left < right) {
            int mid = left + (right - left) / 2;
            if(nums[mid] == target) {
                return mid;
            } else if(nums[mid] < target) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }

        return left;
    }
};

int main() {
    Solution solution;
    vector<int> nums = {1, 3, 5, 6};
    int target = 7;
    int result = solution.searchInsert(nums, target);

    cout << result << endl;
    return 0;
}