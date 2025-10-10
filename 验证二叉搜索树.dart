class Solution {
  int pre = -0x80000001;
  bool isValidBST(TreeNode? root) {
    if (root == null) return true;
    if (!isValidBST(root.left)) return false;
    if (root.val <= pre) return false;
    pre = root.val;
    return isValidBST(root.right);
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0,this.left,this.right]);
}

void main() {
  print(Solution().isValidBST(TreeNode(2,TreeNode(1),TreeNode(3))));
}