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
# @return {String[]}
def binary_tree_paths(root)
  return [] if root.nil?

  output = []
  queue = [[root, root.val.to_s]]

  while !queue.empty?
    
    node, path = queue.shift

    if node.left.nil? && node.right.nil?
      output << path
    end

    if !node.left.nil?
      queue << [node.left, "#{path}->#{node.left.val}"]
    end

    if !node.right.nil?
      queue << [node.right, "#{path}->#{node.right.val}"]
    end
  end

  output
end


root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.right = TreeNode.new(3)
root.left.right = TreeNode.new(5)
p binary_tree_paths(root) # ["1->2->5", "1->3"]

