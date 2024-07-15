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
    stack<TreeNode *> s;
    vector<int> post;
    unordered_map<TreeNode *, int> vis;

    s.push(root);

    while (!s.empty()) {
      vis[s.top()] = 1;

      if (s.top()->left != 0) {
        if (!vis[s.top()->left]) {
          s.push(s.top()->left);
          continue;
        }
      }

      if (s.top()->right != 0) {
        if (!vis[s.top()->right]) {
          s.push(s.top()->right);
          continue;
        }
      }

      post.push_back(s.top()->val);

      s.pop();
    }

    return post;
  }
};

int main() {
  TreeNode *root = new TreeNode(1);

  Solution solution;
  vector<int> result = solution.postorderTraversal(root);
  for (int num : result) {
    cout << num << " ";
  }
  cout << endl;

  return 0;
}