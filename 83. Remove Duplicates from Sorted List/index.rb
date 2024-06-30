# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} head
# @return {ListNode}
def delete_duplicates(head)
  return head if head.nil? || head.next.nil?

  current = head
  while current.next
    if current.val == current.next.val
      current.next = current.next.next
    else
      current = current.next
    end
  end

  head
end

class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

puts delete_duplicates(ListNode.new(1, ListNode.new(1, ListNode.new(2)))) # 1 -> 2

puts delete_duplicates(ListNode.new(1, ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(3)))))) # 1 -> 2 -> 3
