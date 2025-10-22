class Solution {
  TreeNode? buildTree(List<int> inorder, List<int> postorder) {
    if (inorder.isEmpty || postorder.isEmpty) {
      return null;
    }
    
    // 后序遍历的最后一个元素是根节点
    int rootVal = postorder.last;
    TreeNode root = TreeNode(rootVal);
    
    // 在中序遍历中找到根节点的位置
    int rootIndex = inorder.indexOf(rootVal);
    
    // 递归构建左右子树
    root.left = buildTree(
      inorder.sublist(0, rootIndex),
      postorder.sublist(0, rootIndex)
    );
    
    root.right = buildTree(
      inorder.sublist(rootIndex + 1),
      postorder.sublist(rootIndex, postorder.length - 1)
    );
    
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