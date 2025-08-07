class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? reverseKGroup(ListNode? head, int k) {
    if (k == 1) return head;

    final dummy = ListNode();
    List<ListNode> group = [];

    for (int i = 0; i < k; i++) {
      if (head != null) {
        group.add(head);
        head = head.next;
      } else {
        return group.first;
      }
    }

    if (group.last.next != null) {
      group.first.next = reverseKGroup(group.last.next, k);
    } else {
      group.first.next = null;
    }
    dummy.next = group.last;

    for (int i = k - 1; i > 0; i--) {
      group[i].next = group[i - 1];
    }

    return dummy.next;
  }
}
