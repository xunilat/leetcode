class Solution {
  List<List<int>> permute(List<int> nums) {
    List<List<int>> result = [];
    List<bool> sig = List.filled(nums.length, true);
    dfs(nums, [], result, sig);
    return result;
  }
}

void dfs(
  List<int> nums,
  List<int> current,
  List<List<int>> result,
  List<bool> sig,
) {
  if (current.length == nums.length) {
    result.add(current);
    return;
  }
  for (int i = 0; i < nums.length; i++) {
    if (sig[i] == false) continue;
    current.add(nums[i]);
    sig[i] = false;
    dfs(nums, current.toList(), result, sig.toList());
    sig[i] = true;
    current.removeLast();
  }
}

void main() {
  Solution solution = Solution();
  print(solution.permute([1, 2, 3]));
}
