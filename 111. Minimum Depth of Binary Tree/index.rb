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
def min_depth(root)
  # return 0 if root.nil?
  # use bfs to find the min depth
  # not use recursion, use queue

  return 0 if root.nil?

  queue = Array.new
  queue.push(root)

  depth = 1

  while !queue.empty?
    size = queue.size

    size.times do
      node = queue.shift

      if node.left.nil? && node.right.nil?
        return depth
      end

      queue.push(node.left) if !node.left.nil?
      queue.push(node.right) if !node.right.nil?
    end

    depth += 1
  end

  return depth
end

puts min_depth(nil) # 0

puts min_depth(TreeNode.new(1)) # 1

root = TreeNode.new(3)

root.left = TreeNode.new(9)
root.right = TreeNode.new(20)

root.right.left = TreeNode.new(15)
root.right.right = TreeNode.new(7)

puts min_depth(root) # 2
