#include <bits/stdc++.h>

using namespace std;

class Solution {
public:
  int titleToNumber(string columnTitle) {
    int num = 0;

    for (char c : columnTitle) {
      int charValue = c - 'A' + 1;
      num = num * 26 + charValue;
    }

    return num;
  }
};

int main() {
  Solution sol;
  string columnTitle = "A";
  assert(sol.titleToNumber(columnTitle) == 1);
  return 0;
}