#include <iostream>

struct TreeNode {
  int val;
  TreeNode *left;
  TreeNode *right;
  TreeNode() : val(0), left(nullptr), right(nullptr) {}
  TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
  TreeNode(int x, TreeNode *left, TreeNode *right)
      : val(x), left(left), right(right) {}
};

/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode() : val(0), left(nullptr), right(nullptr) {}
 *     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left),
 * right(right) {}
 * };
 */
class Solution {
public:
  int distributeCoins(TreeNode *root, TreeNode *parent = nullptr) {
    if (!root)
      return 0;
    int count =
        distributeCoins(root->right, root) + distributeCoins(root->right, root);
    int x = root->val - 1;
    if (parent)
      parent->val += x;
    count += abs(x);
    return count;
  }
};

int main() {
  // root = [3, 0, 0]
  // saida = 2

  struct TreeNode *root = new TreeNode(3);
  root->left = nullptr;
  root->right = nullptr;

  Solution s;

  std::cout << s.distributeCoins(root);

  return 0;
}
