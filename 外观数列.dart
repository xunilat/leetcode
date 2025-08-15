class Solution {
  String countAndSay(int n) {
    String current = "1";
    for (int i = 2; i <= n; i++) {
      // 从2开始迭代到n
      String next = "";
      int count = 1;
      for (int j = 0; j < current.length; j++) {
        if (j + 1 < current.length && current[j] == current[j + 1]) {
          count++;
        } else {
          next += "$count${current[j]}";
          count = 1;
        }
      }
      current = next;
    }
    return current;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.countAndSay(4));
  print(solution.countAndSay(5));
}
