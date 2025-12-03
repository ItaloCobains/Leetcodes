#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  int x;
  scanf("%d", &x);

  char word[256];

  for (int i = 0; i < x; i++) {
    if(scanf("%255s", word) != 1) return 1;

    size_t len = strlen(word);

    if (len > 10) {
      printf("%c%zu%c\n", word[0], len - 2, word[len - 1]);
    } else {
      printf("%s\n", word);
    }
  }

  return 0;
}
