#include <vector>
#include <iostream>

using namespace std;

class Solution {
public:
    vector<int> nextGreaterElement(vector<int>& nums1, vector<int>& nums2) {
        int n1 = nums1.size(), n2 = nums2.size();
        vector<int> res = vector(n1, -1);

        for (int i = 0; i < n1; i++) {
            int x = nums1[i];

            int p = 0;

            while (nums2[p] != x) p++;

            for (int j = p + 1; j < n2; j++) {
                if (nums2[j] > x) {
                    res[i] = nums2[j];
                    break;
                }
            }
        }

        return res;
    }
};

void print(const vector<int>& v) {
    cout << "[";
    for (size_t k = 0; k < v.size(); ++k) {
        cout << v[k];
        if (k + 1 < v.size()) cout << ", ";
    }
    cout << "]";
}

int main() {
    Solution solution;

    vector<int> a1 = {4, 1, 2}, a2 = {1, 3, 4, 2};
    cout << "nums1=[4, 1, 2] nums2=[1, 3, 4, 2] -> ";
    print(solution.nextGreaterElement(a1, a2));
    cout << "  (esperado: [-1, 3, -1])" << endl;

    vector<int> b1 = {2, 4}, b2 = {1, 2, 3, 4};
    cout << "nums1=[2, 4]    nums2=[1, 2, 3, 4] -> ";
    print(solution.nextGreaterElement(b1, b2));
    cout << "  (esperado: [3, -1])" << endl;

    return 0;
}
