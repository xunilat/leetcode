class Solution {
  List<int> spiralOrder(List<List<int>> matrix) {
    if (matrix.length == 1) return matrix[0];
    List<int> res = [];
    int left = 0, right = matrix[0].length - 1;
    int top = 0, bottom = matrix.length - 1;
    while (true) {
      for (int i = left; i <= right; i++) res.add(matrix[top][i]);
      if (++top > bottom) break;
      for (int i = top; i <= bottom; i++) res.add(matrix[i][right]);
      if (--right < left) break;
      for (int i = right; i >= left; i--) res.add(matrix[bottom][i]);
      if (--bottom < top) break;
      for (int i = bottom; i >= top; i--) res.add(matrix[i][left]);
      if (++left > right) break;
    }
    return res;
  }
}

void main() {
  Solution solution = Solution();
  print(
    solution.spiralOrder([
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
    ]),
  );
}
