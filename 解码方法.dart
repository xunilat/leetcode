class Solution {
  int numDecodings(String s) {
    int n = s.length;
    List<int> res = List.filled(n + 1, 0);
    res[0] = 1;
    for (int i = 1;i <= n;i++) {
      if (s[i - 1] != '0') {
        res[i] += res[i - 1];
      }
      if (i > 1 && s[i - 2] != '0' && ((s[i - 2].codeUnits[0] - '0'.codeUnits[0]) * 10 + (s[i - 1].codeUnits[0] - '0'.codeUnits[0]) <= 26)) {
        res[i] += res[i -2];
      }
    }
    return res[n];
  }
}

void main() {
  Solution solution = Solution();
  print(solution.numDecodings('12'));
}