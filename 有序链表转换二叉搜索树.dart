class Solution {
  ListNode? current;
  
  TreeNode? sortedListToBST(ListNode? head) {
    if (head == null) return null;
    
    // 计算链表长度
    int size = 0;
    ListNode? node = head;
    while (node != null) {
      size++;
      node = node.next;
    }
    
    current = head;
    return _buildBST(0, size - 1);
  }
  
  TreeNode? _buildBST(int left, int right) {
    if (left > right) return null;
    
    int mid = left + (right - left) ~/ 2;
    
    // 递归构建左子树
    TreeNode? leftChild = _buildBST(left, mid - 1);
    
    // 创建当前节点
    TreeNode root = TreeNode(current!.val);
    current = current!.next;
    
    // 递归构建右子树
    TreeNode? rightChild = _buildBST(mid + 1, right);
    
    root.left = leftChild;
    root.right = rightChild;
    
    return root;
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0,this.left,this.right]);
  @override
  String toString() {
    return '$val${right != null ? left : left ?? ''}${right ?? ''}';
  }
}

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0,this.next]);
}