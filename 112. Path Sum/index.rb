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
# @param {Integer} target_sum
# @return {Boolean}
def has_path_sum(root, target_sum)
  # return false if root.nil?
  # use dfs to find the path sum
  # not use recurson, use stack

  return false if root.nil?

  stack = [[root, target_sum - root.val]]

  while !stack.empty?
    node, sum = stack.pop

    if node.left.nil? && node.right.nil? && sum == 0
      return true
    end

    stack.push([node.left, sum - node.left.val]) if !node.left.nil?
    stack.push([node.right, sum - node.right.val]) if !node.right.nil?
  end

  false
end

puts has_path_sum(nil, 0) # false

puts has_path_sum(TreeNode.new(1), 1) # true

root = TreeNode.new(5)

root.left = TreeNode.new(4)

root.right = TreeNode.new(8)

root.left.left = TreeNode.new(11)

root.left.left.left = TreeNode.new(7)

root.left.left.right = TreeNode.new(2)

root.right.left = TreeNode.new(13)

root.right.right = TreeNode.new(4)

root.right.right.right = TreeNode.new(1)

puts has_path_sum(root, 22) # true
