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
# @return {Integer[]}
def preorder_traversal(root)
  result = []
  return result if root.nil?

  result.push(root.val)
  result.concat(preorder_traversal(root.left))
  result.concat(preorder_traversal(root.right))

  result
end

puts preorder_traversal(new TreeNode(1, nil, new TreeNode(2, new TreeNode(3), nil))) == [1, 2, 3]

puts preorder_traversal(nil) == []

puts preorder_traversal(new TreeNode(1)) == [1]
