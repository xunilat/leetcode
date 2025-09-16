import 'dart:math';

class Solution {
  int largestRectangleArea(List<int> heights) {
    int maxval = 0;
    List<int> stack = [];
    heights.insert(0, 0);
    heights.add(0);
    for (int i = 0; i < heights.length; i++) {
      while (stack.isNotEmpty && heights[stack.last] > heights[i]) {
        int current = stack.last;
        stack.removeLast();
        int left = stack.last + 1;
        int right = i - 1;
        maxval = max(maxval, (right - left + 1) * heights[current]);
      }
      stack.add(i);
    }
    return maxval;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.largestRectangleArea([2, 1, 5, 6, 2, 3]));
}
