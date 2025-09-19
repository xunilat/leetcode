class Solution {
  void merge(List<int> nums1,int m,List<int> nums2,int n) {
    for (int i = 0;i < n;i++) {
      nums1[m + i] = nums2[i];
    }
    nums1.sort();
  }
}

void main() {
  Solution solution = Solution();
  List<int> nums1 = [1,2,3,0,0,0];List<int> nums2 = [4,5,6];
  solution.merge(nums1, 3, nums2, 3);
  print(nums1);
}