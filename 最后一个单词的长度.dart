class Solution {
  int lengthOfLastWord(String s) {
    int n = s.length;
    while (n > 0 && s[n - 1] == ' ') n--;
    for (int i = n - 1; i >= 0; i--) {
      if (s[i] == ' ') return n - i - 1;
    }
    return n;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.lengthOfLastWord('hello world '));
  print(solution.lengthOfLastWord('leetcode'));
  print(solution.lengthOfLastWord('      '));
}
