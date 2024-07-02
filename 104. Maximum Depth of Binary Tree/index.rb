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
def max_depth(root)
  # if root is nil return 0
  # if  rooot is not nil return 1 + max of left and right
  return 0 if root.nil?
  return 1 + [max_depth(root.left), max_depth(root.right)].max
end

puts max_depth(
  TreeNode.new(
    3,
    TreeNode.new(9),
    TreeNode.new(
      20,
      TreeNode.new(15),
      TreeNode.new(7)
    )
  )
) # 3
