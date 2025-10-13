class Solution {
  void recoverTree(TreeNode? root) {
    TreeNode? first;
    TreeNode? second;
    TreeNode? prev;
    TreeNode? current = root;
    
    while (current != null) {
      if (current.left == null) {
        // 处理当前节点
        if (prev != null && prev.val > current.val) {
          if (first == null) first = prev;
          second = current;
        }
        prev = current;
        current = current.right;
      } else {
        // 找到前驱节点
        TreeNode? predecessor = current.left;
        while (predecessor!.right != null && predecessor.right != current) {
          predecessor = predecessor.right;
        }
        
        if (predecessor.right == null) {
          // 建立临时链接
          predecessor.right = current;
          current = current.left;
        } else {
          // 断开临时链接并处理当前节点
          predecessor.right = null;
          if (prev != null && prev.val > current.val) {
            if (first == null) first = prev;
            second = current;
          }
          prev = current;
          current = current.right;
        }
      }
    }
    
    // 交换两个错误节点的值
    if (first != null && second != null) {
      int temp = first.val;
      first.val = second.val;
      second.val = temp;
    }
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

void main() {
  TreeNode root = TreeNode(1,TreeNode(3,null,TreeNode(2)));
  Solution solution = Solution();
  solution.recoverTree(root);
  print(root);
}