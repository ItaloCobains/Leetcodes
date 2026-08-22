#include <vector>
#include <iostream>
#include <algorithm>

using namespace std;

class Solution {
public:
    bool predictTheWinner(vector<int>& nums) {
        int n = nums.size();
        vector<vector<int>> dp(n, vector<int>(n, 0));

        for (int i = 0; i < n; ++i) 
            dp[i][i] = nums[i];

        for (int len = 2; len <= n; ++len) {
            for (int i = 0; i + len - 1 < n; ++i) {
                int j = i + len - 1;
                dp[i][j] = max(nums[i] - dp[i + 1][j], nums[j] - dp[i][j - 1]);
            }
        }

        return dp[0][n - 1] >= 0;
    }
};

int main() {
    Solution solution;

    vector<int> a = {1, 5, 2};
    cout << "[1, 5, 2]      -> " << boolalpha << solution.predictTheWinner(a)
         << " (esperado: false)" << endl;

    vector<int> b = {1, 5, 233, 7};
    cout << "[1, 5, 233, 7] -> " << boolalpha << solution.predictTheWinner(b)
         << " (esperado: true)" << endl;

    return 0;
}
