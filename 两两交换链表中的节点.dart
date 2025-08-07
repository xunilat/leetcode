class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? swapPairs(ListNode? head) {
    if (head == null || head.next == null) return head;

    ListNode? new_node = head.next;
    head.next = swapPairs(new_node!.next);
    new_node.next = head;
    return new_node;
  }
}

void main() {
  Solution solution = Solution();
  ListNode? node = solution.swapPairs(ListNode(1, ListNode(2, ListNode(3))));
  print([node?.val, node?.next?.val, node?.next?.next?.val]);
}
