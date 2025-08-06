#include <bits/stdc++.h>

using namespace std;

class Solution {
public:
    int myAtoi(string s) {
        int i = 0, n = s.size();
        while(i < n && s[i] == ' ') i++;

        if (i == n) return 0;

        bool isNegative = false;
        
        if (s[i] == '-') {
            isNegative = true;
            i++;
        } else if (s[i] == '+') {
            i++;
        } else if (!isdigit(s[i])) {
            return 0;
        }

        long long result = 0;
        while (i < n && isdigit(s[i])) {
            result = result * 10 + (s[i] - '0');

            if (result > INT_MAX) {
                return isNegative ? INT_MIN : INT_MAX;
            }

            i++;

        }

        if (isNegative) {
            result = -result;
        }

        return static_cast<int>(result);
    }
};