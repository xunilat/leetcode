class Solution {
  bool isValidSudoku(List<List<String>> board) {
    List<List<bool>> row = List.generate(9, (_) => List.filled(10, false));
    List<List<bool>> col = List.generate(9, (_) => List.filled(10, false));
    List<List<bool>> box = List.generate(9, (_) => List.filled(10, false));
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        if (board[i][j] == '.') continue;
        int n = int.parse(board[i][j]);
        int boxindex = (i ~/ 3) * 3 + j ~/ 3;
        if (row[i][n] || col[j][n] || box[boxindex][n]) {
          return false;
        }
        row[i][n] = true;
        col[j][n] = true;
        box[boxindex][n] = true;
      }
    }
    return true;
  }
}
