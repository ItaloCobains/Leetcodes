# Definition for singly-linked list.
class ListNode
    attr_accessor :val, :next
    def initialize(val = 0, _next = nil)
        @val = val
        @next = _next
    end
end
# @param {ListNode} head
# @return {ListNode}
def reverse_list(head)
  prev = nil
  current = head
  while current
    temp = current.next
    current.next = prev
    prev = current
    current = temp
  end
  prev
end

head = ListNode.new(1, ListNode.new(2, ListNode.new(3, ListNode.new(4, ListNode.new(5)))))

p reverse_list(head) # [5,4,3,2,1]