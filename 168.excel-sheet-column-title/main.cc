#include <bits/stdc++.h>

using namespace std;

class Solution {
public:
  string convertToTitle(int columnNumber) {
    string result;

    while (columnNumber > 0) {
      columnNumber--;
      result += columnNumber % 26 + 'A';
      columnNumber /= 26;
    }

    reverse(result.begin(), result.end());

    return result;
  }
};

int main() {
  Solution solution;

  assert(solution.convertToTitle(1) == "A");
  assert(solution.convertToTitle(28) == "AB");
  assert(solution.convertToTitle(701) == "ZY");
  assert(solution.convertToTitle(2147483647) == "FXSHRXW");

  return 0;
}