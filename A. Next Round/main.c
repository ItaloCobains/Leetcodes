#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  int n, k, cur, count = 0;

  scanf("%d %d", &n, &k);

  for (int i = 0; i < n; i++) {
    scanf("%d", &cur);

    if (cur >= k)
      count++;
  }

  printf("%d", count);

  return 0;
}
