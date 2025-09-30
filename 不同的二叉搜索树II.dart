class Solution {
  List<TreeNode?> generateTrees(int n) {
    if (n == 0) return [];
    return _generateTrees(1, n);
  }

  List<TreeNode?> _generateTrees(int start, int end) {
    List<TreeNode?> trees = [];
    
    if (start > end) {
      trees.add(null);
      return trees;
    }
    
    for (int i = start; i <= end; i++) {
      // 生成所有可能的左子树
      List<TreeNode?> leftTrees = _generateTrees(start, i - 1);
      // 生成所有可能的右子树
      List<TreeNode?> rightTrees = _generateTrees(i + 1, end);
      
      for (TreeNode? left in leftTrees) {
        for (TreeNode? right in rightTrees) {
          TreeNode root = TreeNode(i);
          root.left = left;
          root.right = right;
          trees.add(root);
        }
      }
    }
    
    return trees;
  }
}

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);

  @override
  String toString() {
    return '$val${right != null ? left : left ?? ''}${right ?? ''}';
  }
}

void main() {
  Solution solution = Solution();
  print(solution.generateTrees(3));
}