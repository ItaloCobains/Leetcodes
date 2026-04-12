#include <bits/stdc++.h>
using namespace std;

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);

  int x = 0, y = 0;

  for (size_t i = 0; i < 5; i++)
  {
    for (size_t j = 0; j < 5; j++)
    {
      int z;
      cin >> z;
      
      if (z == 1) {
        y = i + 1;
        x = j + 1;
      }
    }
  }

  cout << abs(y - 3) + abs(x - 3) << '\n';

  return 0;
}