#include <bits/stdc++.h>
using namespace std;

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);

  int m, n; cin >> m >> n;

  int x = m * n;

  if (x % 2 != 0) x--;

  x = x / 2;

  printf("%d", x);

  return 0;
}