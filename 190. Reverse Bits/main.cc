#include <bits/stdc++.h>

using namespace std;

class Solution {
public:
  uint32_t reverseBits(uint32_t n) {
    uint32_t r = n;
    int s = sizeof(n) * 8 - 1;

    for (n >>= 1; n; n >>= 1) {
      r <<= 1;
      r |= n & 1;
      s--;
    }

    r <<= s;

    return r;
  }
};

int main() {
  Solution sol;
  uint32_t n = 43261596;
  assert(sol.reverseBits(n) == 964176192);
  return 0;
}