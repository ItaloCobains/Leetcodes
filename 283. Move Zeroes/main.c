#include "stdio.h"

void moveZeroes(int *nums, int numsSize) {
  int writePos = 0;

  for (int i = 0; i < numsSize; i++) {
    if (nums[i] != 0) {
      nums[writePos++] = nums[i];
    }
  }

  while (writePos < numsSize)
    nums[writePos++] = 0;
}

int main() {
  int nums[5] = {0, 1, 0, 3, 12};
  moveZeroes(nums, 5);

  for (int i = 0; i < 5; i++) {
    printf("%d\n", nums[i]);
  }
}
