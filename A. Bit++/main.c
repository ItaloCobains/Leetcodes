#include <stdio.h>
#include <stdlib.h>

int main(void) {
  int n;
  int x = 0;
  char op[2];

  scanf("%d", &n);

  for (int i = 0; i < n; i++) {
    scanf(" %c%*c%c", &op[0], &op[1]);

    if (op[0] == '+' || op[1] == '+') {
      x++;
    } else {
      x--;
    }
  }

  printf("%d\n", x);
  return 0;
}
