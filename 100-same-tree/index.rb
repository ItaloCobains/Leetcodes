# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  # if both nodes are nil, return true
  # if one of the nodes is nil, return false
  # if the values of the nodes are different, return false
  # recursively call the function with the left and right nodes
  return true if p.nil? && q.nil?
  return false if p.nil? || q.nil?
  return false if p.val != q.val

  is_same_tree(p.left, q.left) && is_same_tree(p.right, q.right)
end

puts is_same_tree(
    TreeNode.new(
        1,
        TreeNode.new(2),
        TreeNode.new(3),
    ),
    TreeNode.new(
        1,
        TreeNode.new(2),
        TreeNode.new(3),
    )
) # Expected: true
