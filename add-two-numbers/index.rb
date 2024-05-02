# Você recebe duas listas vinculadas não vazias que representam dois números inteiros não negativos.
# Os dígitos são armazenados em ordem inversa e cada um de seus nós contém um único dígito. Adicione os dois números e retorne a soma como uma lista vinculada.

# Você pode assumir que os dois números não contêm nenhum zero à esquerda, exceto o próprio número 0.


# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  carry = 0
  dummy = ListNode.new
  current = dummy

  while l1 || l2
    sum = carry
    sum += l1.val if l1
    sum += l2.val if l2

    carry = sum / 10
    current.next = ListNode.new(sum % 10)
    current = current.next

    l1 = l1.next if l1
    l2 = l2.next if l2

    if carry.positive?
      current.next = ListNode.new(carry)
    end

  end

  dummy.next
end

# Exemplo 1:
# Input: l1 = [2,4,3], l2 = [5,6,4]
# Output: [7,0,8]
# Explicação: 342 + 465 = 807.

# Exemplo 2:
# Input: l1 = [0], l2 = [0]
# Output: [0]

# Exemplo 3:
# Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
# Output: [8,9,9,9,0,0,0,1]


class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

p add_two_numbers(ListNode.new(2, ListNode.new(4, ListNode.new(3))), ListNode.new(5, ListNode.new(6, ListNode.new(4)))) # [7,0,8]

p add_two_numbers(ListNode.new(0), ListNode.new(0)) # [0]

p add_two_numbers(ListNode.new(9, ListNode.new(9, ListNode.new(9, ListNode.new(9, ListNode.new(9, ListNode.new(9, ListNode.new(9))))))), ListNode.new(9, ListNode.new(9, ListNode.new(9, ListNode.new(9))))) # [8,9,9,9,0,0,0,1]
