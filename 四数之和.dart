class Solution {
  List<List<int>> fourSum(List<int> nums, int target) {
    if (nums.length < 4) return [];
    nums.sort();
    List<List<int>> result = [];
    if (nums[0] + nums[1] + nums[2] + nums[3] > target) return [];
    for (int i = 0; i < nums.length - 3; i++) {
      if (i > 0 && nums[i] == nums[i - 1]) continue;
      for (int j = i + 1; j < nums.length - 2; j++) {
        if (j > i + 1 && nums[j] == nums[j - 1]) continue;
        int start = j + 1;
        int end = nums.length - 1;
        while (start < end) {
          int sum = nums[i] + nums[j] + nums[start] + nums[end];
          if (sum == target) {
            result.add([nums[i], nums[j], nums[start], nums[end]]);
            while (start < end && nums[start] == nums[start + 1]) start++;
            while (start < end && nums[end] == nums[end - 1]) end--;
            start++;
            end--;
          } else if (sum < target) {
            start++;
          } else {
            end--;
          }
        }
      }
    }
    return result;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.fourSum([2, 2, 2, 2, 2], 8));
}
