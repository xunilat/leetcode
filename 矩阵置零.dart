class Solution {
  void setZeroes(List<List<int>> matrix) {
    int row = matrix.length;
    int col = matrix[0].length;
    bool sig = false;
    for (int i = 0; i < row; i++) {
      if (matrix[i][0] == 0) sig = true;
      for (int j = 1; j < col; j++) {
        if (matrix[i][j] == 0) {
          matrix[i][0] = matrix[0][j] = 0;
        }
      }
    }
    for (int i = row - 1; i >= 0; i--) {
      for (int j = col - 1; j > 0; j--) {
        if (matrix[i][0] == 0 || matrix[0][j] == 0) matrix[i][j] = 0;
      }
      if (sig) matrix[i][0] = 0;
    }
  }
}

void main() {
  Solution solution = Solution();
  var matrix = [
    [1, 2, 3, 4],
    [1, 0, 5, 2],
    [0, 3, 1, 5],
    [2, 4, 6, 0]
  ];
  solution.setZeroes(matrix);
  print(matrix);
}
