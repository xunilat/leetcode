class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    // 使用哨兵节点简化操作
    final dummy = ListNode();
    ListNode? current = dummy;
    
    while (list1 != null && list2 != null) {
      if (list1.val < list2.val) {
        current!.next = list1;  // 连接节点
        list1 = list1.next;     // 移动指针
      } else {
        current!.next = list2;
        list2 = list2.next;
      }
      current = current.next;   // 移动当前指针
    }
    
    // 处理剩余节点
    current!.next = list1 ?? list2;
    
    return dummy.next;  // 哨兵的下一个节点是真实头节点
  }
}