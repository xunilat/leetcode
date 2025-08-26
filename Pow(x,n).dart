class Solution {
  double myPow(double x, int n) {
    if (n == 0) return 1;

    int sig = 1;
    if (n.isNegative) {
      n = n.abs();
      sig = -1;
    }
    double result = 1, current = x;
    while (n > 0) {
      if (n % 2 == 1) {
        result *= current;
      }
      current *= current;
      n ~/= 2;
    }
    return sig == -1 ? 1 / result : result;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.myPow(3, 3));
  print(solution.myPow(5, -2));
  print(solution.myPow(6, 0));
}
