#include <bits/stdc++.h>

/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     struct TreeNode *left;
 *     struct TreeNode *right;
 * };
 */

struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
};

struct TreeNode* invertTree(struct TreeNode* root) {
    if (root == NULL) {
        return NULL;
    }

    struct TreeNode *temp = root->left;
    root->left = root->right;
    root->right = temp;

    invertTree(root->left);
    invertTree(root->right);

    return root;
}

int main(void) {   
    struct TreeNode *root = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    root->val = 4;
    root->left = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    root->left->val = 2;
    root->left->left = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    root->left->left->val = 1;
    root->left->left->left = NULL;
    root->left->left->right = NULL;

    root->left->right = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    root->left->right->val = 3;
    root->left->right->left = NULL;
    root->left->right->right = NULL;

    root->right = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    root->right->val = 7;
    root->right->left = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    root->right->left->val = 6;

    root->right->right = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    root->right->right->val = 9;
    root->right->right->left = NULL;
    root->right->right->right = NULL;

    struct TreeNode *inverted_root = invertTree(root);

    printf("Inverted tree root value: %d\n", inverted_root->val);
    printf("Inverted tree left value: %d\n", inverted_root->left->val);
    printf("Inverted tree right value: %d\n", inverted_root->right->val);

    return 0;
}