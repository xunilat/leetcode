import 'dart:math';

class Solution {
  int jump(List<int> nums) {
    if (nums.length == 1) return 0;
    int n = nums.length;
    int end = 0; //落点
    int count = 0; //步数
    int max_end = 0; //最远落点
    for (int i = 0; i < n; i++) {
      max_end = max(max_end, i + nums[i]);
      if (max_end >= n - 1) break;
      if (i == end) {
        end = max_end;
        count++;
      }
    }
    return count + 1;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.jump([2, 3, 0, 1, 4])); //[2,4,2,4,8],2
  print(solution.jump([2, 3, 1, 0, 3, 6])); //[2,4,3,3,7,11],3
  print(solution.jump([2, 1, 3, 4, 5])); //[2,2,5,7,9],2
  print(solution.jump([1, 1, 1, 1, 1])); //[1,2,3,4,5],4
}
