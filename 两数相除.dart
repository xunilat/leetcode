class Solution {
  int divide(int dividend, int divisor) {
    int sign, count = 0, result = 0;
    dividend.sign == divisor.sign ? sign = 1 : sign = -1;

    dividend = dividend.abs();
    divisor = divisor.abs();

    while (dividend > divisor) {
      divisor = divisor << 1;
      count++;
    }

    while (count >= 0) {
      if (dividend >= divisor) {
        //print([count, dividend, divisor, result]);
        dividend = dividend - divisor;
        result = result + (1 << count);
        //print([count, dividend, divisor, result]);
      } else {
        divisor = divisor >> 1;
        count--;
      }
    }
    if (sign == -1) {
      result = -result;
    }
    return result < 2147483647 ? result : 2147483647;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.divide(-2147483648,1));
}
