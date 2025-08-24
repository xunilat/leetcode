class Solution {
  List<List<int>> permuteUnique(List<int> nums) {
    nums.sort();
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
    if (i > 0 && nums[i] == nums[i - 1] && sig[i - 1]) continue;
    current.add(nums[i]);
    sig[i] = false;
    dfs(nums, current.toList(), result, sig.toList());
    current.removeLast();
    sig[i] = true;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.permuteUnique([1, 1,1, 2]));
}
