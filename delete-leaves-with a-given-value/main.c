#include <stdio.h>
#include <stdlib.h>

struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
};

/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */
struct TreeNode* removeLeafNodes(struct TreeNode* root, int target) {
    if (!root) return NULL;

    root->left = removeLeafNodes(root->left, target);
    root->right = removeLeafNodes(root->right, target);

    if (!root->left && !root->right && root->val == target) {
        free(root);
        return NULL;
    }

    return root;
}

int main() {
    //[1,2,3,2,null,2,4]
    struct TreeNode *root = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    root->val = 1;
    root->left = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    root->left->val = 2;
    root->left->left = NULL;
    root->left->right = NULL;
    root->right = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    root->right->val = 3;
    root->right->left = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    root->right->left->val = 2;
    root->right->left->left = NULL;
    root->right->left->right = NULL;
    root->right->right = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    root->right->right->val = 2;
    root->right->right->left = NULL;
    root->right->right->right = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    root->right->right->right->val = 4;
    root->right->right->right->left = NULL;
    root->right->right->right->right = NULL;
    struct TreeNode *result = removeLeafNodes(root, 2);


    return 0;
}