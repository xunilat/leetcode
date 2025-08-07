import 'dart:math';

class Solution {
  int maxArea(List<int> height) {
    int s = 0;
    int start = 0;
    int end = height.length - 1;
    while (start != end) {
      s = max(s, (end - start) * min(height[start], height[end]));
      height[start] < height[end] ? start++ : end--;
    }
    return s;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.maxArea([1,1]));
}
