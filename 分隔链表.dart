class Solution {
  ListNode? partition(ListNode? head, int x) {
    ListNode sml_dummy = ListNode(0), big_dummy = ListNode(0);
    ListNode sml = sml_dummy, big = big_dummy;
    while (head != null) {
      if (head.val < x) {
        sml.next = head;
        sml = sml.next!;
      } else {
        big.next = head;
        big = big.next!;
      }
      head = head.next;
    }
    sml.next = big_dummy.next;
    big.next = null;
    return sml_dummy.next;
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
  @override
  String toString() {
    // TODO: implement toString
    return '$val${next != null ? ' -> $next' : ''}';
  }
}

void main() {
  Solution solution = Solution();
  print(solution.partition(ListNode(2, ListNode(1, ListNode(3,ListNode(1,ListNode(2))))), 2));
}