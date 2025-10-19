#include <stdbool.h>

// The API isBadVersion is defined for you.
bool isBadVersion(int version);

int firstBadVersion(int n) {
  // verificar se n é um numero ruim
  // se for, verificar se o anterior é ruim
  // deve retornar o primeiro ruim
  // posso usar busca binaria para otimizar a busca
  
  int left = 1;
  int right = n;
  while (left < right) {
    int mid = left + ((right - left) >> 1);
    if (isBadVersion(mid)) {
      right = mid;
    } else {
      left = mid + 1;
    }
  }

  return left;
}