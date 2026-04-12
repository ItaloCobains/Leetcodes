#include <bits/stdc++.h>
using namespace std;

typedef long long ll;

ll gcd_ll(ll a, ll b) {
  while (b != 0) {
    ll t = a % b;
    a = b;
    b = t;
  }
  return a;
}

int main() {
  ios::sync_with_stdio(false);
  cin.tie(nullptr);

  int t;
  cin >> t;

  while (t--) {
    int n;
    cin >> n;

    vector<ll> a(n);
    for (int i = 0; i < n; i++) {
      cin >> a[i];
    }

    a.erase(unique(a.begin(), a.end()), a.end());

    ll c = 1;
    bool running = true;

    while (running) {
      c++;

      for (ll v : a) {
        if (gcd_ll(c, v) == 1) {
          running = false;
          break;
        }
      }
    }

    cout << c << '\n';
  }

  return 0;
}