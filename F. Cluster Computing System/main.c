#include <stdio.h>

static int gcd(int a, int b) {
  while (b) {
    int t = a % b;
    a = b;
    b = t;
  }
  return a;
}

int main() {
  int n;
  if (scanf("%d", &n) != 1)
    return 0;

  static int p[200000];
  static int pref[200000];
  static int suf[200000];

  for (int i = 0; i < n; i++)
    scanf("%d", &p[i]);

  int g = 0;
  for (int i = 0; i < n; i++) {
    g = gcd(g, p[i]);
    pref[i] = g;
  }

  g = 0;
  for (int i = n - 1; i >= 0; i--) {
    g = gcd(g, p[i]);
    suf[i] = g;
  }

  long long ans = 0;
  for (int i = 0; i < n - 1; i++) {
    ans += (pref[i] < suf[i]) ? pref[i] : suf[i];
  }

  printf("%lld\n", ans);
  return 0;
}
