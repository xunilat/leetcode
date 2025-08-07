class Solution {
  List<List<int>> threeSum(List<int> nums) {
    List<List<int>> result = [];
    nums.sort();
    if (nums.isEmpty || nums[0] > 0 || nums.last < 0) return result;

    for (int i = 0; i < nums.length - 2; i++) {
      // 跳过重复的起始值
      if (i > 0 && nums[i] == nums[i - 1]) continue;
      
      int start = i + 1;
      int end = nums.length - 1;
      
      while (start < end) {
        int sum = nums[i] + nums[start] + nums[end];
        
        if (sum < 0) {
          start++;
        } else if (sum > 0) {
          end--;
        } else {
          result.add([nums[i], nums[start], nums[end]]);
          // 跳过重复的左指针
          while (start < end && nums[start] == nums[start + 1]) start++;
          // 跳过重复的右指针
          while (start < end && nums[end] == nums[end - 1]) end--;
          // 移动指针寻找新组合
          start++;
          end--;
        }
      }
    }
    return result;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.threeSum([-1,0,1])); // 输出 [[-1, 0, 1]]
}