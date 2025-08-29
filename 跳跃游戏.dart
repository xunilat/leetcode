import 'dart:math';

class Solution {
  bool canJump(List<int> nums) {
    int n = nums.length;
    int end_max = 0;
    for (int i = 0; i < n; i++) {
      if (i <= end_max) {
        end_max = max(end_max, i + nums[i]);
        if (end_max >= n - 1) return true;
      }
    }
    return false;
  }
}