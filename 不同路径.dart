class Solution {
  int uniquePaths(int m, int n) {
    int res = 1;
    for (int x = n, y = 1; y < m; x++, y++) {
      res = res * x ~/ y;
    }
    return res;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.uniquePaths(3, 5));
}
