#include <stdbool.h>
#include <stdio.h>
#include <string.h>

bool repeatedSubstringPattern(char *s) {
  int n = strlen(s);

  for (int k = 1; k <= n / 2; k++) {
    if (n % k != 0)
      continue;

    bool ok = true;
    for (int i = k; i < n; i++) {
      if (s[i] != s[i - k]) {
        ok = false;
        break;
      }
    }
    if (ok)
      return true;
  }

  return false;
}

int main(void) {
  struct {
    char *s;
    bool expected;
  } tests[] = {
      {"abab", true},       {"aba", false}, {"abcabcabc", true},
      {"aaaa", true},       {"abc", false}, {"abcabd", false},
      {"a", false},         {"aa", true},   {"aabaaba", false},
      {"abaababaab", true},
  };

  for (int i = 0; i < (int)(sizeof(tests) / sizeof(*tests)); i++) {
    bool got = repeatedSubstringPattern(tests[i].s);
    printf("%-12s esperado=%-5s obtido=%-5s %s\n", tests[i].s,
           tests[i].expected ? "true" : "false", got ? "true" : "false",
           got == tests[i].expected ? "OK" : "FALHOU");
  }

  return 0;
}
