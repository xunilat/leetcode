import 'dart:math';

class Solution {
  int maxSubArray(List<int> nums) {
    int res = nums[0];
    int sum = nums[0];
    for (int i = 1; i < nums.length; i++) {
      sum = max(sum + nums[i], nums[i]);
      res = max(sum, res);
    }
    return res;
  }
}
