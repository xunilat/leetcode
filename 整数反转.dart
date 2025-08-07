class Solution {
  int reverse(int x) {
    bool is_negative = x < 0;
    x = x.abs();
    int result = 0;
    while (x != 0) {
      if (x > 214748364) return 0;
      result = result * 10 + x % 10;
      x = x ~/ 10;
    }
    return is_negative ? -result : result;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.reverse(-123));
  print(solution.reverse(120));
  print(solution.reverse(0));
}
