class Solution {
  int removeDuplicates(List<int> nums) {
    int n = nums.length;
    if (n <= 2) return n;

    int slow = 2, fast = 2;
    while (fast < n) {
      if (nums[slow - 2] != nums[fast]) {
        nums[slow] = nums[fast];
        slow++;
      }
      fast++;
    }
    return slow;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.removeDuplicates([1, 1, 1, 2, 2, 3]));
}
