import 'dart:collection';

class Solution {
  List<List<int>> zigzagLevelOrder(TreeNode? root) {
    Queue<TreeNode> queue = Queue();
    List<List<int>> res = [];
    if (root != null) queue.add(root);
    int count = 1;
    while (!queue.isEmpty) {
      List<int> tmp = [];
      for (int i = queue.length;i > 0;i--) {
        TreeNode node = queue.removeFirst();
        tmp.add(node.val);
        if (node.left != null) queue.add(node.left!);
        if (node.right != null) queue.add(node.right!);
      }
      if (count++ % 2 == 0) {
        res.add(tmp.reversed.toList());
      } else {
        res.add(tmp);
      }
    }
    return res;
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0,this.left,this.right]);
}

void main() {
  print(Solution().zigzagLevelOrder(TreeNode(3,TreeNode(9),TreeNode(20,TreeNode(15),TreeNode(7)))));
}