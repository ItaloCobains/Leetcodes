#include <bits/stdc++.h>

using namespace std;

struct ListNode {
  int val;
  ListNode *next;
  ListNode(int x) : val(x), next(NULL) {}
};

class Solution {
public:
  ListNode *getIntersectionNode(ListNode *headA, ListNode *headB) {
    ListNode *p1 = headA;
    ListNode *p2 = headB;

    while (p1 != p2) {
      p1 = p1 == nullptr ? headB : p1->next;
      p2 = p2 == nullptr ? headA : p2->next;
    }

    return p1;
  }
};

int main() {
  ListNode *headA = new ListNode(4);
  headA->next = new ListNode(1);
  headA->next->next = new ListNode(8);
  headA->next->next->next = new ListNode(4);
  headA->next->next->next->next = new ListNode(5);

  ListNode *headB = new ListNode(5);
  headB->next = new ListNode(0);
  headB->next->next = new ListNode(1);
  headB->next->next->next = headA->next->next;

  Solution solution;
  ListNode *result = solution.getIntersectionNode(headA, headB);
  cout << result->val << endl;

  return 0;
}