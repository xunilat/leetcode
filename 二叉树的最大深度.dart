import 'dart:math';

class Solution {
  int maxDepth(TreeNode? root) {
    if (root == null) return 0;
    return max(maxDepth(root.left), maxDepth(root.right)) + 1;
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0,this.left,this.right]);
}

void main() {
  print(Solution().maxDepth(TreeNode(3,TreeNode(9),TreeNode(20,TreeNode(15,TreeNode(10)),TreeNode(7)))));
}