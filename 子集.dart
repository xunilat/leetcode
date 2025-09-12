class Solution {
  List<List<int>> subsets(List<int> nums) {
    List<List<int>> res = [];
    dfs(nums, res, [], 0);
    return res;
  }
}

void dfs(List<int> nums, List<List<int>> res, List<int> current, int start) {
  res.add(current.toList());
  if (nums.length < start) return;
  for (int i = start; i < nums.length; i++) {
    current.add(nums[i]);
    dfs(nums, res, current, i + 1);
    current.removeLast();
  }
}

void main() {
  Solution solution = Solution();
  print(solution.subsets([1, 2, 3]));
}
