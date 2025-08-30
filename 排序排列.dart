class Solution {
  String getPermutation(int n, int k) {
    List<bool> sig = List.filled(n, true);
    List<String> res = [];
    dfs(res, n, '', sig, k);
    return res.last;
  }
}

void dfs(List<String> res, int n, String current, List<bool> sig, int k) {
  if (current.length == n) {
    res.add(current);
    return;
  }
  if (res.length == k) return;
  for (int i = 1; i <= n; i++) {
    if (sig[i - 1] == false) continue;
    current += '$i';
    sig[i - 1] = false;
    dfs(res, n, current, sig, k);
    current = current.substring(0, current.length - 1);
    sig[i - 1] = true;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.getPermutation(3, 3));
}
