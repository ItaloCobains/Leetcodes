#include <iostream>
#include <vector>

using namespace std;

class Solution {
public:
    vector<int> getRow(int rowIndex) {
      if (rowIndex == 0) return vector<int>(1, 1);

      if (rowIndex == 1) return vector<int>(2, 1);

      vector<int> result(rowIndex + 1, 1);

      for (int i = 2; i <= rowIndex; i++) {
        for (int j = i - 1; j > 0; j--) {
          result[j] = result[j] + result[j - 1];
        }
      }

      return result;
    }
};

int main() {
    Solution solution;
    vector<int> result = solution.getRow(0);
    for (int i = 0; i < result.size(); i++) {
        cout << result[i] << " ";
    }
    cout << endl;
    return 0;
}