/**
 * Definition for a binary tree node.
 * class TreeNode(_value: Int = 0, _left: TreeNode = null, _right: TreeNode = null) {
 *   var value: Int = _value
 *   var left: TreeNode = _left
 *   var right: TreeNode = _right
 * }
 */
object Solution {
    def removeLeafNodes(root: TreeNode, target: Int): TreeNode = {
        if (root == null) return null
        root.left = removeLeafNodes(root.left, target)
        root.right = removeLeafNodes(root.right, target)
        if (root.left == null && root.right == null && root.value == target) return null
        root
    }
}