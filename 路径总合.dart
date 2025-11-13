class Solution {
  bool hasPathSum(TreeNode? root,int targetSum) {
    if (root == null) {
      return false;
    }
    if (root.left == null && root.right == null) {
      return root.val == targetSum;
    }
    return hasPathSum(root.left, targetSum - root.val) || hasPathSum(root.right, targetSum - root.val);
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
  TreeNode root = TreeNode(5,TreeNode(4,TreeNode(11)),TreeNode(8,TreeNode(13),TreeNode(4)));
  print(solution.hasPathSum(root, 17));
}