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
def inorder_traversal(root)
    # interate recursively through the tree
    # return the values in an array
    return [] if root.nil?
    inorder_traversal(root.left) + [root.val] + inorder_traversal(root.right)
end

puts inorder_traversal(
    TreeNode.new(
        1,
        nil,
        TreeNode.new(
            2,
            TreeNode.new(3),
            nil
        )
    )
)
