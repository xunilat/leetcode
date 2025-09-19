class Solution {
  List<int> grayCode(int n) {
    List<int> res = [];
    res.add(0);
    for (int i = 1;i <= n;i++) {
      int m = res.length;
      for (int j = m - 1;j >= 0;j--) {
        res.add(res[j] | (1 << (i - 1)));
      }
    }
    return res;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.grayCode(3));
}