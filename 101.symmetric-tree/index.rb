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
# @return {Boolean}
def is_symmetric(root)
  # if the root is nil, return true
  # iterate with a queue with the left and right nodes
  # if the values of the nodes are different, return false

  return true if root.nil?

  queue = Array.new
  queue.push(root.left)
  queue.push(root.right)

  while !queue.empty?
    left = queue.shift
    right = queue.shift

    next if left.nil? && right.nil?
    return false if left.nil? || right.nil?
    return false if left.val != right.val

    queue.push(left.left)
    queue.push(right.right)
    queue.push(left.right)
    queue.push(right.left)
  end

  true
end


puts is_symmetric(
    TreeNode.new(
        1,
        TreeNode.new(2),
        TreeNode.new(2),
    )
) # Expected: true
