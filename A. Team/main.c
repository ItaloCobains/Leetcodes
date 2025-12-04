#include <stdio.h>
#include <stdlib.h>

int main() {
  int x = 0;
  scanf("%d", &x);
  int a, b, c, z, count = 0;
  for (int i = 0; i < x; i++) {
    scanf("%d %d %d", &a, &b, &c);

    z = a + b + c;
    if (z > 1) {
      count++;
    }
  }

  printf("%d\n", count);
  return 0;
}
