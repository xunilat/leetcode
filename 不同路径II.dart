class Solution {
  int uniqueWithObstacles(List<List<int>> obstacleGrid) {
    int n = obstacleGrid.length, m = obstacleGrid[0].length;
    List<int> res = List.filled(m, 0);

    res[0] = obstacleGrid[0][0] == 0 ? 1 : 0;
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        if (obstacleGrid[i][j] == 1) {
          res[j] = 0;
          continue;
        }
        if (j - 1 >= 0 && obstacleGrid[i][j - 1] == 0) {
          res[j] += res[j - 1];
        }
      }
    }
    return res[m - 1];
  }
}

void main() {
  Solution solution = Solution();
  print(
    solution.uniqueWithObstacles([
      [0, 0, 0],
      [0, 1, 0],
      [0, 0, 0],
    ]),
  );
}
