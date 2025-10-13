class Solution {
  bool isSameTree(TreeNode? p,TreeNode? q) {
    if (p == null && q == null) {
      return true;
    } else if (p == null || q == null) {
      return false;
    } else if (p.val != q.val) {
      return false;
    } else {
      return isSameTree(p.left, q.left) && isSameTree(p.right, q.right);
    }
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
  print(solution.isSameTree(TreeNode(1,TreeNode(2),TreeNode(1)), TreeNode(1,TreeNode(2),TreeNode(1))));
}