#include <iostream>

struct TreeNode {
    int val;
    TreeNode* left;
    TreeNode* right;
    TreeNode() : val(0), left(nullptr), right(nullptr) {}
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
    TreeNode(int x, TreeNode* left, TreeNode* right)
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
 *     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
 * };
 */
class Solution {
public:
    TreeNode* removeLeafNodes(TreeNode* root, int target) {
        if (root == nullptr) {
            return nullptr;
        }
       
        root->left = this->removeLeafNodes(root->left, target);
        root->right = this->removeLeafNodes(root->right, target);

        if (root->left == nullptr && root->right == nullptr && root->val == target) {
            return nullptr;
        }

        return root;
    }
};

void printTree(TreeNode* root) {
    if (root == nullptr) {
        return;
    }

    printTree(root->left);
    std::cout << root->val << " ";
    printTree(root->right);
}

int main() {

    // struct TreeNode* root = new TreeNode(1);
    // root->left = new TreeNode(2);
    // root->left->left = new TreeNode(2);
    // root->right = new TreeNode(3);
    // root->right->left = new TreeNode(2);
    // root->right->right = new TreeNode(4);

    struct TreeNode* root = new TreeNode(1);
    root->left = new TreeNode(1);
    root->right = new TreeNode(1);

    Solution s;

    s.removeLeafNodes(root, 1);

    // printTree(root);

    return 0;
}
