class Solution {
  int threeSumClosest(List<int> nums, int target) {
    nums.sort();
    int closest = nums[0] + nums[1] + nums[2]; // 初始化为前三个数的和

    for (int i = 0; i < nums.length - 2; i++) {
      // 跳过重复元素（可选优化）
      if (i > 0 && nums[i] == nums[i - 1]) continue;
      
      int start = i + 1;
      int end = nums.length - 1;
      
      while (start < end) {
        int sum = nums[i] + nums[start] + nums[end];
        
        // 找到目标值直接返回
        if (sum == target) return sum;
        
        // 更新最接近的和
        if ((sum - target).abs() < (closest - target).abs()) {
          closest = sum;
        }
        
        // 移动指针
        if (sum < target) {
          start++;
        } else {
          end--;
        }
      }
    }
    return closest;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.threeSumClosest([-1, 2, 1, -4], 1)); // 输出: 2
}