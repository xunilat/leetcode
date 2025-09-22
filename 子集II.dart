class Solution {
  List<List<int>> subsetsWithDup(List<int> nums) {
    List<List<int>> res = [];
    nums.sort();
    void dfs(int start,List<int> current) {
      if (start == nums.length) {
        res.add(current.toList());
        return;
      }
      current.add(nums[start]);
      dfs( start + 1, current);
      current.removeLast();
      while (start + 1 < nums.length && nums[start + 1] == nums[start]) start++;
      dfs( start + 1, current);
    }
    dfs(0, []);
    return res;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.subsetsWithDup([1,2,2]));
}