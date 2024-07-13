#include <iostream>

using namespace std;

struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(NULL) {}
};


class Solution {
public:


    bool hasCycle(ListNode *head) {
      ListNode *slow = head,
               *fast = head;

      while (slow != NULL
        && fast != NULL
        && fast->next != NULL
      ) {
        slow = slow->next;
        fast = fast->next->next;
        if (slow == fast)
          return -1;
      }

      return 0;
    }
};

int main() {
    Solution solution;
    ListNode *head = new ListNode(3);
    head->next = new ListNode(2);
    head->next->next = new ListNode(0);
    head->next->next->next = new ListNode(-4);
    head->next->next->next->next = head->next;
    cout << solution.hasCycle(head) << endl;
    return 0;
}