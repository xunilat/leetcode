class Solution {
  bool solveSudoku(List<List<String>> board) {
    for (int row = 0; row < 9; row++) {
      for (int col = 0; col < 9; col++) {
        // 跳过已填数字
        if (board[row][col] != '.') continue;
        
        // 尝试填入1-9
        for (int num = 1; num <= 9; num++) {
          if (_isValid(board, row, col, num.toString())) {
            board[row][col] = num.toString(); // 填入数字
            if (solveSudoku(board)) {
              return true; // 递归解决剩余空格
            }
            board[row][col] = '.'; // 回溯，撤销填入
          }
        }
        return false; // 无解
      }
    }
    return true; // 所有空格填完
  }

  // 检查数字是否有效
  bool _isValid(List<List<String>> board, int row, int col, String num) {
    // 检查行和列
    for (int i = 0; i < 9; i++) {
      if (board[row][i] == num || board[i][col] == num) {
        return false;
      }
    }
    // 检查3x3宫格
    int boxRow = (row ~/ 3) * 3;
    int boxCol = (col ~/ 3) * 3;
    for (int i = boxRow; i < boxRow + 3; i++) {
      for (int j = boxCol; j < boxCol + 3; j++) {
        if (board[i][j] == num) {
          return false;
        }
      }
    }
    return true;
  }
}