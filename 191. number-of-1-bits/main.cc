#include <bits/stdc++.h>

using namespace std;

class Solution {
public:
  int hammingWeight(int n) {
    int count = 0;
    while (n != 0) {
      int bit = n & 1;

      if (bit != 0) {
        count++;
      }

      n >>= 1;
    }

    return count;
  }
};

int main() {
  Solution sol;
  assert(sol.hammingWeight(0b00000000000000000000000000001011) == 3);
  return 0;
}