class Solution {
  int maximalRectangle(List<List<String>> matrix) {
    if (matrix.isEmpty || matrix[0].isEmpty) return 0;
    
    int n = matrix.length;
    int m = matrix[0].length;
    List<int> heights = List.filled(m, 0);
    int maxArea = 0;
    
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < m; j++) {
        if (matrix[i][j] == '1') {
          heights[j] += 1;
        } else {
          heights[j] = 0;
        }
      }
      maxArea = max(maxArea, _largestRectangleArea(heights));
    }
    
    return maxArea;
  }
  
  int _largestRectangleArea(List<int> heights) {
    List<int> stack = [];
    int maxArea = 0;
    int i = 0;
    
    while (i < heights.length) {
      if (stack.isEmpty || heights[i] >= heights[stack.last]) {
        stack.add(i);
        i++;
      } else {
        int top = stack.removeLast();
        int width = stack.isEmpty ? i : i - stack.last - 1;
        maxArea = max(maxArea, heights[top] * width);
      }
    }
    
    while (stack.isNotEmpty) {
      int top = stack.removeLast();
      int width = stack.isEmpty ? i : i - stack.last - 1;
      maxArea = max(maxArea, heights[top] * width);
    }
    
    return maxArea;
  }
  
  int max(int a, int b) => a > b ? a : b;
}