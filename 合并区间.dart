import 'dart:math';

class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    intervals.sort((start, end) => start[0].compareTo(end[0]));
    List<List<int>> res = [];
    for (int i = 0; i < intervals.length; i++) {
      int left = intervals[i][0], right = intervals[i][1];
      if (res.length == 0 || res[res.length - 1][1] < left) {
        res.add([left, right]);
      } else {
        res[res.length - 1][1] = max(res[res.length - 1][1], right);
      }
    }
    return res;
  }
}

void main() {
  Solution solution = Solution();
  print(
    solution.merge([
      [1, 3],
      [2, 6],
      [8, 10],
      [15, 18],
    ]),
  );
}
