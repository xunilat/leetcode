class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
  @override
  String toString() {
    return '$val${next != null ? ' -> $next' : ''}';
  }
}

class Solution {
  ListNode? deleteDuplicates(ListNode? head) {
    if (head == null) return head;
    ListNode dummy = ListNode(0, head);
    ListNode? current = dummy;
    while (current!.next != null && current.next!.next != null) {
      if (current.next!.val == current.next!.next!.val) {
        int x = current.next!.val;
        while (current.next != null && current.next!.val == x) {
          current.next = current.next!.next;
        }
      } else {
        current = current.next;
      }
    }
    return dummy.next;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.deleteDuplicates(ListNode(0, ListNode(0, ListNode(1,ListNode(2))))));
}
