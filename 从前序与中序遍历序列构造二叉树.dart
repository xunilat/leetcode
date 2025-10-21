class Solution {
  TreeNode? buildTree(List<int> preorder,List<int> inorder) {
    if (preorder.isEmpty || inorder.isEmpty) return null;
    TreeNode root = TreeNode(preorder[0]);
    int rootindex = inorder.indexOf(preorder[0]);
    root.left = buildTree(preorder.sublist(1,1+rootindex), inorder.sublist(0,rootindex));
    root.right = buildTree(preorder.sublist(1 + rootindex), inorder.sublist(rootindex + 1));
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
  print(Solution().buildTree([3,9,20,15,7], [9,3,15,20,7]));
}