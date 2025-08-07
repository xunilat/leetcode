class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    int temp = 0;
    ListNode node = ListNode(0);
    ListNode? vnode = node;

    while (l1 != null || l2 != null || temp != 0) {
      int val1 = l1?.val ?? 0;
      int val2 = l2?.val ?? 0;
      int v = val1 + val2 + temp;
      temp = v ~/ 10;
      vnode!.next = ListNode(v % 10);
      l1 = l1?.next;
      l2 = l2?.next;
      vnode = vnode.next;
    }
    return node.next;
  }
}
