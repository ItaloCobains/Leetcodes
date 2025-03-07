#include <bits/stdc++.h>

using namespace std;

class Solution
{
public:
    vector<string> summaryRanges(vector<int> &nums)
    {
        vector<string> result;

        for (int i = 0; i < nums.size(); i++)
        {
            int start = nums[i];
            while (i + 1 < nums.size() && nums[i + 1] == nums[i] + 1)
                i++;

            if (start != nums[i])
            {
                result.push_back(to_string(start) + "->" + to_string(nums[i]));
            }
            else
            {
                result.push_back(to_string(start));
            }
        }

        return result;
    }
};

int main()
{
    Solution solution;
    vector<int> input = {0, 1, 2, 4, 5, 7};
    vector<string> output = solution.summaryRanges(input);

    for (string s : output)
    {
        cout << s << " ";
    }

    return 0;
}