class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    final dummy = ListNode();
    ListNode? current = dummy;

    while (list1 != null && list2 != null) {
      if (list1.val < list2.val) {
        current!.next = list1;
        list1 = list1.next;
      } else {
        current!.next = list2;
        list2 = list2.next;
      }
      current = current.next;
    }

    current!.next = list1 ?? list2;

    return dummy.next;
  }

  ListNode? mergeKLists(List<ListNode?> lists) {
    if (lists.length == 0) return null;
    if (lists.length == 1) return lists[0];

    int start = 0;
    int end = 1;
    List<ListNode?> temp = [];
    while (start < lists.length && end < lists.length) {
      temp.add(mergeTwoLists(lists[start], lists[end]));
      start = start + 2;
      end = end + 2;
    }
    if (lists.length.isOdd) {
      temp.add(lists[lists.length - 1]);
    }
    return mergeKLists(temp);
  }
}
