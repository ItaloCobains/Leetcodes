/**
 * Definition for a binary tree node.
 */

class TreeNode {
  val: number
  left: TreeNode | null
  right: TreeNode | null
  constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
      this.val = (val===undefined ? 0 : val)
      this.left = (left===undefined ? null : left)
      this.right = (right===undefined ? null : right)
  }
}

function isBalanced(root: TreeNode | null): boolean {
  if (!root) return true;
  return Math.abs(height(root.left) - height(root.right)) <= 1 && isBalanced(root.left) && isBalanced(root.right);
};

function height(root: TreeNode | null): number {
  if (!root) return 0;
  return Math.max(height(root.left), height(root.right)) + 1;
}

console.log(isBalanced(new TreeNode(3, new TreeNode(9), new TreeNode(20, new TreeNode(15), new TreeNode(7))))) // true

