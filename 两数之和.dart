class Solution {
  List<int> twoSum(List<int> nums, int target) {
    Map<int, int> map = {};
    for (int i = 0; i < nums.length; i++) {
      int ntarget = target - nums[i];
      if (map.containsKey(ntarget)) {
        return [map[ntarget]!, i];
      }
      map[nums[i]] = i;
    }
    return [];
  }
}
