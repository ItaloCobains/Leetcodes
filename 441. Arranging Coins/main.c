#include <stdio.h>

int arrangeCoins(int n) {
  int completed = 0;

  for (int i = 1; i <= n; i++) {
    n -= i;
  }

  return completed;
}
