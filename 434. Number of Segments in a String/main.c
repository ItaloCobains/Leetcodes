#include <ctype.h>
#include <stdio.h>
#include <string.h>

char *trim(char *s) {
  char *end;

  while (isspace((unsigned char)*s))
    s++;

  if (*s == 0)
    return s;

  end = s + strlen(s) - 1;
  while (end > s && isspace((unsigned char)*end))
    end--;

  end[1] = '\0';

  return s;
}

int countSegments(char *s) {
  char *str = trim(s);

  int count = 0;
  int inWord = 0;

  for (int i = 0; str[i]; i++) {
    if (!isspace((unsigned char)str[i])) {
      if (!inWord) {
        count++;
        inWord = 1;
      }
    } else {
      inWord = 0;
    }
  }

  return count;
}

int main() {
  char texto[] = "   hello  world   ";
  printf("%d", countSegments(texto));
}
