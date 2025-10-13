class Solution {
  bool isSymmetric(TreeNode? root) {
    return check(root!.left, root.right);
  }
}

bool check(TreeNode? p,TreeNode? q) {
  if (p == null && q == null) {
    return true;
  } else if (p == null || q == null) {
    return false;
  } else {
    return p.val == q.val && check(p.left, q.right) && check(p.right, q.left);
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0,this.left,this.right]);
}

void main() {
  print(Solution().isSymmetric(TreeNode(2,TreeNode(1),TreeNode(1))));
}