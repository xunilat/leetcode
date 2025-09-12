class Solution {
  bool exist(List<List<String>> board, String word) {
    
    int m = board.length;
    int n = board[0].length;
    
    // 创建访问标记矩阵
    List<List<bool>> visited = List.generate(m, (_) => List.filled(n, false));
    
    for (int i = 0; i < m; i++) {
      for (int j = 0; j < n; j++) {
        if (board[i][j] == word[0] && dfs(board, word, 0, i, j, visited)) {
          return true;
        }
      }
    }
    
    return false;
  }
  
  bool dfs(
    List<List<String>> board,
    String word,
    int index,
    int row,
    int col,
    List<List<bool>> visited,
  ) {
    // 如果已经找到完整单词，返回true
    if (index == word.length) {
      return true;
    }
    
    // 检查边界条件和是否已访问
    if (row < 0 || row >= board.length || 
        col < 0 || col >= board[0].length || 
        visited[row][col] || 
        board[row][col] != word[index]) {
      return false;
    }
    
    // 标记当前单元格为已访问
    visited[row][col] = true;
    
    // 尝试四个方向
    bool found = dfs(board, word, index + 1, row - 1, col, visited) ||
                dfs(board, word, index + 1, row + 1, col, visited) ||
                dfs(board, word, index + 1, row, col - 1, visited) ||
                dfs(board, word, index + 1, row, col + 1, visited);
    
    // 回溯：取消标记当前单元格
    visited[row][col] = false;
    
    return found;
  }
}

void main() {
  Solution solution = Solution();
  print(
    solution.exist([
      ['a', 'b', 'c'],
      ['d', 'e', 'f'],
      ['a', 'r', 'c'],
    ], 'adarc'),
  ); // 应该输出: true
}