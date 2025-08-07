//假设数组为 [1,5\6,8,9]
//和                   [2,3,4\7,10]

import 'dart:math';

class Solution {
 double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
  // 确保 nums1 是较短的数组
  if (nums1.length > nums2.length) {
    return findMedianSortedArrays(nums2, nums1);
  }

  int m = nums1.length;
  int n = nums2.length;
  int totalLeft = (m + n + 1) ~/ 2;

  int left = 0;
  int right = m;

  while (left <= right) {
    int i = (left + right) ~/ 2;
    int j = totalLeft - i;

    if (i < m && nums2[j - 1] > nums1[i]) {
      left = i + 1; // i 需要增大
    } else if (i > 0 && nums1[i - 1] > nums2[j]) {
      right = i - 1; // i 需要减小
    } else {
      // 找到正确的分割点
      int maxLeft;
      if (i == 0) {
        maxLeft = nums2[j - 1];
      } else if (j == 0) {
        maxLeft = nums1[i - 1];
      } else {
        maxLeft = max(nums1[i - 1], nums2[j - 1]);
      }

      if ((m + n) % 2 == 1) {
        return maxLeft.toDouble();
      }

      int minRight;
      if (i == m) {
        minRight = nums2[j];
      } else if (j == n) {
        minRight = nums1[i];
      } else {
        minRight = min(nums1[i], nums2[j]);
      }

      return (maxLeft + minRight) / 2;
    }
  }

  return 0.0; // 不会执行到这里
}
}

void main() {
  Solution solution = Solution();
  print(solution.findMedianSortedArrays([5, 6, 7, 8, 9], [4,6,8,10]));
}
