class Solution {
  bool isPalindrome(int x) {
    if (x.isNegative) return false;
    if (x != 0 && x % 10 == 0) return false;
    int late = 0;
    while (x > late) {
      late = late * 10 + x % 10;
      x ~/= 10;
    }
    return x == late || x == late ~/ 10;
  }
}
