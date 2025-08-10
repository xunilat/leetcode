class Solution {
  int search(List<int> nums, int target) {
    int left = 0, right = nums.length - 1;
    
    while (left <= right) {
      int mid = left + (right - left) ~/ 2;
      
      if (nums[mid] == target) return mid;
      
      // 左半部分有序
      if (nums[left] <= nums[mid]) {
        if (nums[left] <= target && target < nums[mid]) {
          right = mid - 1;
        } else {
          left = mid + 1;
        }
      } 
      // 右半部分有序
      else {
        if (nums[mid] < target && target <= nums[right]) {
          left = mid + 1;
        } else {
          right = mid - 1;
        }
      }
    }
    
    return -1;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.search([4, 5, 7, 0, 1, 2], 0));
}
