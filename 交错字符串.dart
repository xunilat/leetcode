class Solution {
  bool isInterleave(String s1,String s2,String s3) {
    int len1 = s1.length,len2 = s2.length,len3 = s3.length;
    if (len1 + len2 != len3) return false;
    List<List<bool>> dp = List.generate(len1 + 1, (_) => List.filled(len2 + 1, false));
    dp[0][0] = true;
    for (int i = 1;i < len1 + 1;i++) {
      dp[i][0] = dp[i - 1][0] && s1[i - 1] == s3[i - 1];
    }
    for (int i = 1;i < len2 + 1;i++) {
      dp[0][i] = dp[0][i - 1] && s2[i - 1] == s3[i - 1];
    }
    for (int i = 1;i < len1 + 1;i++) {
      for (int j = 1;j < len2 + 1;j++) {
        dp[i][j] = (dp[i][j - 1] && s2[j - 1] == s3[i + j - 1]) || (dp[i - 1][j] && s1[i - 1] == s3[i + j - 1]);
      }
    }
    return dp[len1][len2];
  }
}

void main() {
  Solution solution = Solution();
  print(solution.isInterleave('aabcc', 'dbbca', 'aadbbcbcac'));
  print(solution.isInterleave('aabcc', 'dbbca', 'aadbbbaccc'));
}