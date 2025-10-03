class Solution {
  int numTrees(int n) {
    List<int> dp = List.filled(n + 1, 0);
    dp[0] = 1;
    dp[1] = 1;
    for (int i = 2;i < n + 1;i++) {
      for (int j = 1;j < i + 1;j++) {
        dp[i] += dp[j - 1] * dp[i - j];
      }
    }
    return dp[n];
  }
}

void main() {
  Solution solution = Solution();
  print(solution.numTrees(3));
}