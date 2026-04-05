#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

bool judgeCircle(char *moves) {
  int x = 0;
  int y = 0;

  for (int i = 0; moves[i] != '\0'; i++) {
    char move = moves[i];

    if (move == 'U')
      y++;

    if (move == 'D')
      y--;

    if (move == 'L')
      x--;

    if (move == 'R')
      x++;
  }

  return (x == 0) && (y == 0) ? true : false;
}
