class Solution {
  String longestCommonPrefix(List<String> strs) {
    if (strs.length == 1) return strs[0];
    List<String> s = [];
    int index = 0;
    strs.sort();
    if (strs[0].isEmpty) return "";
    while (index < strs[0].length && index < strs[strs.length - 1].length && strs[0][index] == strs[strs.length - 1][index]) {
      s.add(strs[0][index]);
        index++;
    }
    return s.join();
  }
}

void main() {
  Solution solution = Solution();
  print(solution.longestCommonPrefix(["a","ab"]));
}
