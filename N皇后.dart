class Solution {
  List<List<String>> solveNQueens(int n) {
    List<List<String>> result = [];
    List<List<String>> board = List.generate(n, (_) => List.filled(n, '.'));
    dfs(result, board, 0);
    return result;
  }

  void dfs(List<List<String>> result, List<List<String>> board, int row) {
    if (row == board.length) {
      result.add(board.map((e) => e.join('')).toList());
      return;
    }
    for (int col = 0; col < board.length; col++) {
      if (check(board, row, col)) {
        board[row][col] = 'Q';
        dfs(result, board, row + 1);
        board[row][col] = '.';
      }
    }
  }

  bool check(List<List<String>> board, int row, int col) {
    for (int i = 0; i < row; i++) {
      if (board[i][col] == 'Q') return false;
    }
    for (int i = row - 1, j = col - 1; i >= 0 && j >= 0; i--, j--) {
      if (board[i][j] == 'Q') return false;
    }
    for (int i = row - 1, j = col + 1; i >= 0 && j < board.length; i--, j++) {
      if (board[i][j] == 'Q') return false;
    }
    return true;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.solveNQueens(1));
  print(solution.solveNQueens(3));
  print(solution.solveNQueens(4));
}
