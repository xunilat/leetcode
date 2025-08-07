class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? removeNthFromEnd(ListNode? head, int n) {
    if (head == null) return null;
    
    List<ListNode> nodes = [];
    ListNode? current = head;
    while (current != null) {
      nodes.add(current);
      current = current.next;
    }
    
    int len = nodes.length;
    int indexToRemove = len - n; // 目标节点索引
    
    // 处理头节点删除
    if (indexToRemove == 0) {
      return head.next; // 返回新头节点
    }
    
    // 修改前驱节点的next指针
    ListNode prev = nodes[indexToRemove - 1];
    prev.next = nodes[indexToRemove].next;
    
    return head;
  }
}
