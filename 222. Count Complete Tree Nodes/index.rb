# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {TreeNode} root
# @return {Integer}
def count_nodes(root)
  count = 0

  return count if root.nil?
  return 1 if root.left.nil? && root.right.nil?

  left = count_nodes(root.left)
  right = count_nodes(root.right)

  1 + left + right
end

root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.right = TreeNode.new(3)
root.left.left = TreeNode.new(4)
root.left.right = TreeNode.new(5)
root.right.left = TreeNode.new(6)
p count_nodes(root) # 6