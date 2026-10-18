#include <iostream>
#include <set>
#include <vector>

using namespace std;

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);

  int n, a, b, c;
  cin >> n >> a >> b >> c;

  set<int> cuts{a, b, c};

  vector<int> dp(n + 1, -1);
  dp[0] = 0;

  for (int i = 1; i <= n; i++) {
    for (int cut : cuts) {
      if (i >= cut) {
        if (dp[i - cut] != -1) {
          dp[i] = max(dp[i], dp[i - cut] + 1);
        }
      }
    }
  }

  cout << dp[n] << "\n";

  return dp[n];
}
