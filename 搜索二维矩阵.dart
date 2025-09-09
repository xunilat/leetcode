class Solution {
  bool searchMatrix(List<List<int>> matrix, int target) {
    
    int m = matrix.length;
    int n = matrix[0].length;
    
    int left = 0, right = m * n - 1;
    
    while (left <= right) {
      int mid = left + (right - left) ~/ 2;
      
      int row = mid ~/ n;
      int col = mid % n;
      
      if (matrix[row][col] == target) {
        return true;
      } else if (matrix[row][col] < target) {
        left = mid + 1;
      } else {
        right = mid - 1;
      }
    }
    
    return false;
  }
}

void main() {
  Solution solution = Solution();
  print(
    solution.searchMatrix([
      [1, 2, 3],
      [4, 5, 6]
    ], 2),
  );
}