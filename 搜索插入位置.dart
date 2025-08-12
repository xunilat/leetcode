class Solution {
  int searchInsert(List<int> nums, int target) {
    int size = nums.length;
    int left = 0, right = size - 1;

    if (nums[left] >= target) return left;
    if (nums[right] < target) return size;

    while (left <= right) {
      int mid = (left + right) ~/ 2;
      if (nums[mid] == target || nums[mid] > target && nums[mid - 1] < target) {
        return mid;
      }
      if (target < nums[mid]) {
        right = mid - 1;
      } else {
        left = mid + 1;
      }
    }
    return 0;
  }
}

void main() {
  Solution solution = Solution();

  print(solution.searchInsert([1, 3], 3));
  print(solution.searchInsert([1, 3, 5, 6], 5));
  print(solution.searchInsert([1, 3, 5, 6], 2));
  print(solution.searchInsert([1, 2, 3, 4, 5], 6));
  print(solution.searchInsert([1, 2, 3, 4, 5], 0));
}
