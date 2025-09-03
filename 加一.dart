class Solution {
  List<int> plusOne(List<int> digits) {
    for (int i = digits.length - 1; i >= 0; i--) {
      digits[i]++;
      digits[i] = digits[i] % 10;
      if (digits[i] != 0) return digits;
    }
    digits.add(0);
    digits[0] = 1;
    return digits;
  }
}
