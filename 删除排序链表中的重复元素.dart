class Solution {
  ListNode? deleteDuplicates(ListNode? head) {
    if (head == null) return head;
    ListNode? current = head;
    while (current != null && current.next != null) {
      if (current.val == current.next!.val) {
        current.next = current.next!.next;
      } else {
        current = current.next;
      }
    }
    return head;
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
  @override
  String toString() {
    return '$val${next != null ? ' -> $next' : ''}';
  }
}

void main() {
  Solution solution = Solution();
  print(solution.deleteDuplicates(ListNode(0, ListNode(1, ListNode(1)))));
}
