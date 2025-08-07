class Solution {
  void nextPermutation(List<int> nums) {
    if (nums.length == 1) return;

    int i = nums.length - 2;
    // 从后向前查找第一个升序对 (i, i+1)
    while (i >= 0 && nums[i] >= nums[i + 1]) {
      i--;
    }

    if (i >= 0) {
      int j = nums.length - 1;
      // 从后向前查找第一个大于 nums[i] 的元素
      while (j > i && nums[j] <= nums[i]) {
        j--;
      }
      // 交换 nums[i] 和 nums[j]
      int temp = nums[i];
      nums[i] = nums[j];
      nums[j] = temp;
    }

    // 反转从 i+1 到末尾的子数组
    int left = i + 1;
    int right = nums.length - 1;
    while (left < right) {
      int temp = nums[left];
      nums[left] = nums[right];
      nums[right] = temp;
      left++;
      right--;
    }
  }
}

void main() {
  Solution solution = Solution();
  List<int> nums = [3,1,4,2];
  solution.nextPermutation(nums);
  print(nums); // 输出 [2, 1, 3]
}