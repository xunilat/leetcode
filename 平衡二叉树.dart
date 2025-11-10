import 'dart:math';

class Solution {
  bool isBalanced(TreeNode? root) {
    if (root == null) {
      return true;
    } else {
      return (height(root.left) - height(root.right)).abs() <= 1 && isBalanced(root.left) && isBalanced(root.right);
    }
  }
}

int height (TreeNode? root) {
  if (root == null) {
    return 0;
  } else {
    return max(height(root.left), height(root.right)) + 1;
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0,this.left,this.right]);
}

void main() {
  Solution solution = Solution();
  TreeNode root = TreeNode(3,TreeNode(9),TreeNode(20,TreeNode(15),TreeNode(7)));
  print(solution.isBalanced(root));
}