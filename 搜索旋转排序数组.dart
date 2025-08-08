class Solution {
  int search(List<int> nums, int target) {
    if (nums.length == 1) {
      return nums[0] == target ? 0 : -1;
    }

    int left = 0, right = nums.length - 1;
    while (left <= right) {
      int index = (left + right) ~/ 2;
      if (nums[index] == target) {
        return index;
      }
      if (nums[0] <= nums[index]) {
        if (nums[0] <= target && target < nums[index]) {
          right = index - 1;
        } else {
          left = index + 1;
        }
      } else {
        if (nums[index] < target && target <= nums[nums.length - 1]) {
          left = index + 1;
        } else {
          right = index - 1;
        }
      }
    }
    return -1;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.search([4, 5, 6, 7, 0, 1, 2], 0));
}
