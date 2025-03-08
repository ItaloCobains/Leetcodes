#include <bits/stdc++.h>

class Solution
{
public:
    int minimumRecolors(std::string blocks, int k)
    {
        int min_recolors = INT_MAX;
        for (int i = 0; i <= blocks.size() - k; i++)
        {
            int recolors = 0;
            for (int j = 0; j < k; j++)
            {
                if (blocks[i + j] == 'W')
                {
                    recolors++;
                }
            }
            min_recolors = std::min(min_recolors, recolors);
        }
        return min_recolors;
    }
};

int main()
{
    Solution s;

    std::cout << s.minimumRecolors("WBBWWBBWBW", 7) << std::endl; // 3
    std::cout << s.minimumRecolors("WBWBBBW", 2) << std::endl;    // 0
}