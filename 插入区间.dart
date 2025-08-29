import 'dart:math';

class Solution {
  List<List<int>> insert(List<List<int>> intervals, List<int> newInterval) {
    List<List<int>> res = [];
    int i = 0;
    int n = intervals.length;
    
    // 添加所有在新区间之前的区间
    while (i < n && intervals[i][1] < newInterval[0]) {
      res.add(intervals[i]);
      i++;
    }
    
    // 合并所有与新区间重叠的区间
    while (i < n && intervals[i][0] <= newInterval[1]) {
      newInterval[0] = min(newInterval[0], intervals[i][0]);
      newInterval[1] = max(newInterval[1], intervals[i][1]);
      i++;
    }
    res.add(newInterval);
    
    // 添加所有在新区间之后的区间
    while (i < n) {
      res.add(intervals[i]);
      i++;
    }
    
    return res;
  }
}

void main() {
  Solution solution = Solution();
  print(
    solution.insert(
      [
        [1, 2],
        [3, 5],
        [6, 7],
        [8, 10],
        [12, 16],
      ],
      [4, 8],
    ),
  );
}