class Solution {
  ListNode? reverseBetween(ListNode? head,int left,int right) {
    ListNode dummy = ListNode(-1);
    dummy.next = head;
    ListNode pre = dummy;
    for (int i = 0;i < left - 1;i++) {
      pre = pre.next!;
    }
    ListNode cur = pre.next!;
    ListNode next;
    for (int i = 0; i < right - left;i++) {
      next = cur.next!;
      cur.next = next.next;
      next.next = pre.next;
      pre.next = next;
    }
    return dummy.next;
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0,this.next]);
  @override
  String toString() {
    return '$val${next != null ? ' -> $next' : ''}';
  }
}

void main() {
  Solution solution = Solution();
  print(solution.reverseBetween(ListNode(1,ListNode(2,ListNode(3,ListNode(4,ListNode(5))))),2, 4));
}