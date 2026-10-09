#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

struct TreeNode {
    int val;
    struct TreeNode *left;
    struct TreeNode *right;
};

/**
 * Note: The returned array must be malloced, assume caller calls free().
 */
int *findMode(struct TreeNode *root, int *returnSize) {
    struct TreeNode *current = root;
    int *modes = NULL;
    size_t capacity = 0;

    int size = 0;
    int previous = 0;
    int count = 0;
    int maxCount = 0;
    int failed = 0;

    *returnSize = 0;

    while (current != NULL) {

        if (current->left != NULL) {

            struct TreeNode *predecessor = current->left;

            while (predecessor->right != NULL &&
                   predecessor->right != current) {

                predecessor = predecessor->right;
            }

            if (predecessor->right == NULL) {

                predecessor->right = current;
                current = current->left;
                continue;
            }

            predecessor->right = NULL;
        }

        if (failed) {

            current = current->right;
            continue;
        }

        if (count > 0 && current->val == previous)
            count++;
        else
            count = 1;

        previous = current->val;

        if (count > maxCount) {

            maxCount = count;
            size = 0;
        }

        if (count == maxCount) {

            if ((size_t)size == capacity) {

                size_t newCapacity = capacity ? capacity * 2 : 1;
                int *tmp = realloc(modes, newCapacity * sizeof *modes);

                if (tmp == NULL) {

                    failed = 1;
                    current = current->right;
                    continue;
                }

                modes = tmp;
                capacity = newCapacity;
            }

            modes[size++] = current->val;
        }

        current = current->right;
    }

    if (failed) {

        free(modes);
        return NULL;
    }

    *returnSize = size;
    return modes;
}

int main(void) {
    // Árvore: [1, null, 2, 2]
    //   1
    //    \
    //     2
    //    /
    //   2
    struct TreeNode leaf = {2, NULL, NULL};
    struct TreeNode right = {2, &leaf, NULL};
    struct TreeNode root = {1, NULL, &right};

    int returnSize = 0;
    int *modes = findMode(&root, &returnSize);
    assert(modes != NULL && returnSize == 1 && modes[0] == 2);
    assert(root.left == NULL && root.right == &right &&
           right.left == &leaf && right.right == NULL &&
           leaf.left == NULL && leaf.right == NULL);

    printf("Esperado: [2]\nResultado: [");
    for (int i = 0; i < returnSize; i++) {
        printf("%s%d", i > 0 ? ", " : "", modes[i]);
    }
    printf("]\n");

    free(modes);
    return 0;
}
