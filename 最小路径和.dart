import 'dart:math';

class Solution {
  int minPathSum(List<List<int>> grid) {
    if (grid.isEmpty || grid[0].length == 0) return 0;
    int row = grid.length, col = grid[0].length;
    List<List<int>> dp = List.generate(row, (_) => List.filled(col, 0));
    dp[0][0] = grid[0][0];
    for (int i = 1; i < row; i++) {
      dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    for (int j = 1; j < col; j++) {
      dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    for (int i = 1; i < row; i++) {
      for (int j = 1; j < col; j++) {
        dp[i][j] = min(dp[i - 1][j] + grid[i][j], dp[i][j - 1] + grid[i][j]);
      }
    }
    return dp[row - 1][col - 1];
  }
}

void main() {
  Solution solution = Solution();
  print(
    solution.minPathSum([
      [1, 3, 1],
      [1, 5, 1],
      [4, 2, 1],
    ]),
  );
}
