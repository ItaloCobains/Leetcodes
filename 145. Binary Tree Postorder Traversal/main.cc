#include <bits/stdc++.h>

using namespace std;

struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
  TreeNode() : val(0), left(nullptr), right(nullptr) {}
  TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
  TreeNode(int x, TreeNode *left, TreeNode *right)
      : val(x), left(left), right(right) {}
};

class Solution {
public:
  vector<int> postorderTraversal(TreeNode *root) {
    vector<int> ans;
    stack<TreeNode *> st;
    TreeNode *lastVisited = nullptr;

    while (root || !st.empty()) {
      while (root) {
        st.push(root);
        root = root->left;
      }
      TreeNode *node = st.top();

      if (!node->right || node->right == lastVisited) {
        ans.push_back(node->val);
        st.pop();
        lastVisited = node;
      } else {
        root = node->right;
      }
    }

    return ans;
  }
};

int main() {
  TreeNode *root = new TreeNode(1);
  root->right = new TreeNode(2);
  root->right->left = new TreeNode(3);

  Solution solution;
  vector<int> result = solution.postorderTraversal(root);
  for (int num : result) {
    cout << num << " ";
  }
  cout << endl;

  return 0;
}