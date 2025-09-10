class Solution {
  void sortColors(List<int> nums) {
    int left = 0, n = nums.length;
    for (int i = 0; i < n; i++) {
      if (nums[i] == 0) {
        int temp = nums[left];
        nums[left] = nums[i];
        nums[i] = temp;
        left++;
      }
    }
    for (int i = left; i < n; i++) {
      if (nums[i] == 1) {
        int temp = nums[left];
        nums[left] = nums[i];
        nums[i] = temp;
        left++;
      }
    }
  }
}

void main() {
  Solution solution = Solution();
  List<int> nums = [1, 0, 2, 0, 1];
  solution.sortColors(nums);
  print(nums);
}
