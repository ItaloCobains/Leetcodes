#include <stdio.h>

long long gcd(long long a, long long b) {
  while (b) {
    long long t = a % b;
    a = b;
    b = t;
  }
  return a;
}

int main() {
  int t;
  scanf("%d", &t);

  while (t--) {
    int n;
    scanf("%d", &n);

    long long a[n];
    for (int i = 0; i < n; i++) {
      scanf("%lld", &a[i]);
    }

    long long answer = -1;

    for (long long x = 2; x <= 50; x++) {
      int ok = 0;
      for (int i = 0; i < n; i++) {
        if (gcd(a[i], x) == 1) {
          ok = 1;
          break;
        }
      }
      if (ok) {
        answer = x;
        break;
      }
    }

    printf("%lld\n", answer);
  }

  return 0;
}
