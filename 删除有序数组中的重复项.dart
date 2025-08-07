class Solution {
  int removeDuplicates(List<int> nums) {
    Set<int> set = nums.toSet();
    nums.clear();
    nums.addAll(set);
    return nums.length;
  }
}
