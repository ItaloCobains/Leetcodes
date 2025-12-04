#include <stdio.h>
#include <stdlib.h>

int main() {
  int x, y, z = 0;

  scanf("%d %d %d", &x, &y, &z);

  int menor = x, maior = x;

  if (y < menor) menor = y;
  if (z < menor) menor = z;
  if (y > maior) maior = y;
  if (z > maior) maior = z;

  if (maior - menor >= 10) {
    printf("check again\n");
  } else {
    int meio = x + y + z - menor - maior;

    printf("final %d\n", meio);
  }

  return 0;
}
