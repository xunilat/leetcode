class Solution {
  ListNode? rotateRight(ListNode? head, int k) {
    if (head == null || k == 0) return head;
    
    // 计算链表长度并找到尾节点
    ListNode? current = head;
    int n = 1;
    while (current!.next != null) {
      current = current.next;
      n++;
    }
    
    // 计算实际需要旋转的次数
    k = k % n;
    if (k == 0) return head;
    
    // 将链表成环
    current.next = head;
    
    // 找到新的尾节点（第 n - k 个节点）
    ListNode? newTail = head;
    for (int i = 0; i < n - k - 1; i++) {
      newTail = newTail!.next;
    }
    
    // 新的头节点是新的尾节点的下一个节点
    ListNode? newHead = newTail!.next;
    
    // 断开环
    newTail.next = null;
    
    return newHead;
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
  ListNode head = ListNode(1, ListNode(2, ListNode(3, null)));
  print(solution.rotateRight(head, 1)); //3 -> 1 -> 2
}