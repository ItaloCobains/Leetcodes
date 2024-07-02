# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end
# @param {Integer[]} nums
# @return {TreeNode}
def sorted_array_to_bst(nums)
  # if nums is empty return nil
  # if nums has 1 element return TreeNode.new(nums[0])
  # sort nums and get the middle element
  # create a new TreeNode with the middle element
  # set the left child to sorted_array_to_bst(nums[0...middle])
  # set the right child to sorted_array_to_bst(nums[middle+1..-1])
  # return the node
  return nil if nums.empty?
  return TreeNode.new(nums[0]) if nums.length == 1

  middle = nums.length / 2
  node = TreeNode.new(nums[middle])
  node.left = sorted_array_to_bst(nums[0...middle])
  node.right = sorted_array_to_bst(nums[middle+1..-1])
  node
end

puts sorted_array_to_bst([-10,-3,0,5,9]) # [0,-3,9,-10,null,5]
