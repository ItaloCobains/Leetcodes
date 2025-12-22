#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int minDeletionSize(char** strs, int strsSize) {
  int n = strlen(strs[0]);
  int* dp = (int*)calloc(n, sizeof(int));
  int max_keep = 0;

  for (int j = 0; j < n; ++j) {
    dp[j] = 1;
    for (int k = 0; k < j; ++k) {
      int valid = 1;
      for (int r = 0; r < strsSize; ++r) {
        if (strs[r][k] > strs[r][j]) {
          valid = 0;
          break;
        }
      }
      if (valid && dp[k] + 1 > dp[j]) {
        dp[j] = dp[k] + 1;
      }
    }
    if (dp[j] > max_keep) max_keep = dp[j];
  }
  free(dp);
  return n - max_keep;
}

int main() {
  char* strs[] = {"babca","bbazb"};
  int strsSize = 2;
  printf("{\"babca\",\"bbazb\"} -> %d\n", minDeletionSize(strs, strsSize));

  char* strs2[] = {"edcba"};
  int strsSize2 = 1;
  printf("{\"edcba\"} -> %d\n", minDeletionSize(strs2, strsSize2));

  char* strs3[] = {"ghi","def","abc"};
  int strsSize3 = 3;
  printf("{\"ghi\",\"def\",\"abc\"} -> %d\n", minDeletionSize(strs3, strsSize3));
  return 0;
}