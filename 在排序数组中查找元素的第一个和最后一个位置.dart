class Solution {
  List<int> searchRange(List<int> nums, int target) {
    int start = 0, end = nums.length - 1;
    while (start <= end) {
      int mid = (start + end) ~/ 2;
      if (nums[mid] == target) {
        start = end = mid;
        while (start > 0 && nums[start - 1] == target) start--;
        while (end < nums.length - 1 && nums[end] == nums[end + 1]) end++;
        return [start, end];
      }
      if (nums[mid] < target) {
        start = mid + 1;
      } else {
        end = mid - 1;
      }
    }
    return [-1, -1];
  }
}

void main() {
  Solution solution = Solution();
  print(solution.searchRange([5, 7, 7, 8, 8, 10], 8));
  print(solution.searchRange([], 1));
}
