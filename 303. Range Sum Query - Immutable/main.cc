#include <vector>
#include <numeric>
#include <iostream>

using namespace std;

class NumArray {
private: 
  vector<int> nums;
public:
  NumArray(vector<int>& nums) : nums(nums) {}
  
  int sumRange(int left, int right) {
    return accumulate(nums.begin() + left, nums.begin() + right + 1, 0);
  }
};

/**
 * Your NumArray object will be instantiated and called as such:
 * NumArray* obj = new NumArray(nums);
 * int param_1 = obj->sumRange(left,right);
 */
int main() {
    vector<int> nums = {-2, 0, 3, -5, 2, -1};
    NumArray obj = NumArray(nums);
    
    cout << "sumRange(0, 2) = " << obj.sumRange(0, 2) << endl;
    cout << "sumRange(2, 5) = " << obj.sumRange(2, 5) << endl;
    cout << "sumRange(0, 5) = " << obj.sumRange(0, 5) << endl;
    
    return 0;
}