class Solution {
  bool isMatch(String s, String p) {
    if (!RegExp(r"^([a-z]|\*|\.)*$").hasMatch(p)) return false;
    if (p[0] == '*') return false;
    return RegExp("^$p\$").hasMatch(s);
  }
}

void main() {
  var solution = Solution();
  print(solution.isMatch("aa", "a*"));
}
