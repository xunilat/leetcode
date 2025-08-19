import 'dart:math';

class Solution {
  int trap(List<int> height) {
    int result = 0;
    int left = 0, right = height.length - 1;
    int left_max = 0, right_max = 0;
    while (left < right) {
      left_max = max(left_max, height[left]);
      right_max = max(right_max, height[right]);
      if (height[left] < height[right]) {
        result += left_max - height[left];
        left++;
      } else {
        result += right_max - height[right];
        right--;
      }
    }
    return result;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.trap([4, 2, 0, 3, 2, 5]));
  print(solution.trap([3, 4, 5, 6, 5, 7, 6, 5]));
}
