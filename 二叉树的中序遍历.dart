class Solution {
  List<int> inorderTraversal(TreeNode? root) {
    List<int> res = [];
    inorder(root, res);
    return res;
  }
}

void inorder(TreeNode? root,List<int> res) {
  if (root == null) return;
  inorder(root.left, res);
  res.add(root.val);
  inorder(root.right, res);
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0,this.left,this.right]);
}

void main() {
  Solution solution = Solution();
  print(solution.inorderTraversal(TreeNode(1,null,TreeNode(2,TreeNode(3)))));
}