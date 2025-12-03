#include <stdio.h>
#include <stdlib.h>

int main() {
  int x;
  scanf("%d", &x);

  if (x % 2 == 0 && x >= 4)
    printf("YES\n");
  else
   printf("NO\n");
  return 0;
}
