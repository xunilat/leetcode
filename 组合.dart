class Solution {
  List<List<int>> combine(int n, int k) {
    List<List<int>> res = [];
    dfs(1, n, k, res, []);
    return res;
  }
}

void dfs(int start, int n, int k, List<List<int>> res, List<int> current) {
  if (current.length == k) {
    res.add(current.toList());
    return;
  }
  for (int i = start; i <= n; i++) {
    current.add(i);
    dfs(i + 1, n, k, res, current);
    current.removeLast();
  }
}

void main() {
  Solution solution = Solution();
  print(solution.combine(4, 2));
  print(solution.combine(1, 1));
}
