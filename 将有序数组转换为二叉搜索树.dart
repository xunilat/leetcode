class Solution {
  TreeNode? sortedArrayToBST(List<int> nums) {
    if (nums.isEmpty) return null;
    
    int mid = nums.length ~/ 2;
    TreeNode root = TreeNode(nums[mid]);
    
    root.left = sortedArrayToBST(nums.sublist(0, mid));
    root.right = sortedArrayToBST(nums.sublist(mid + 1));
    
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

void main() {
  print(TreeNode(0,TreeNode(-3,TreeNode(-10)),TreeNode(9,TreeNode(5))));
}