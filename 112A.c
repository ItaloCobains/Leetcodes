#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>

#define MAX_LEN 102

int main(void) {
  char s1[MAX_LEN] = {0}, s2[MAX_LEN] = {0};

  fgets(s1, MAX_LEN, stdin);
  fgets(s2, MAX_LEN, stdin);

  for (int i = 0; s1[i] != '\0' && s2[i] != '\0'; i++) {
    char c1 = tolower((unsigned char)s1[i]);
    char c2 = tolower((unsigned char)s2[i]);

    if (c1 == '\n')
      c1 = '\0';
    if (c2 == '\n')
      c2 = '\0';

    if (c1 < c2) {
      printf("-1\n");
      return 0;
    }

    if (c1 > c2) {
      printf("1\n");
      return 0;
    }

    if (c1 == '\0' && c2 == '\0') {
      break;
    }
  }

  printf("0\n");
  return 0;
}
