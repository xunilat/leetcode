class Solution {
  List<List<int>> generateMatrix(int n) {
    List<List<int>> res = List.generate(n, (_) => List.filled(n, 0));
    int left = 0, right = n - 1;
    int top = 0, bottom = n - 1;
    int num = 1, last = n * n;
    while (num <= last) {
      for (int i = left; i <= right; i++) res[top][i] = num++;
      top++;
      for (int i = top; i <= bottom; i++) res[i][right] = num++;
      right--;
      for (int i = right; i >= left; i--) res[bottom][i] = num++;
      bottom--;
      for (int i = bottom; i >= top; i--) res[i][left] = num++;
      left++;
    }
    return res;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.generateMatrix(3));
}
