class Solution {
  List<List<int>> combinationSum2(List<int> candidates, int target) {
    List<List<int>> result = [];
    candidates.sort();
    dfs(result, [], candidates, target, 0);
    return result;
  }
}

void dfs(
  List<List<int>> result,
  List<int> temp,
  List<int> candidates,
  int target,
  int index,
) {
  if (target == 0) {
    result.add(temp.toList());
  }
  for (int i = index; i < candidates.length; i++) {
    if (target - candidates[i] < 0) continue;
    if (i > index && candidates[i] == candidates[i - 1]) continue;
    temp.add(candidates[i]);
    dfs(result, temp.toList(), candidates, target - candidates[i], i + 1);
    temp.removeLast();
  }
}

void main() {
  Solution solution = Solution();
  print(solution.combinationSum2([2, 3, 6, 7], 7));
  print(solution.combinationSum2([2, 3, 5], 8));
  print(solution.combinationSum2([10, 1, 2, 7, 6, 1, 5], 8));
}
