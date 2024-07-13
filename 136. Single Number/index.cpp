#include <vector>
#include <iostream>

using namespace std;

class Solution {
public:
    int singleNumber(vector<int>& nums) {
        int acc = 0;
        for(const int& num : nums) {
            acc = acc ^ num;
        }

        return acc;
    }
};

int main() {
    Solution solution;
    vector<int> nums = {4, 1, 2, 1, 2};
    int result = solution.singleNumber(nums);
    cout << result;
    return 0;
}