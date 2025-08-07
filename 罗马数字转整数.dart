class Solution {
  int romanToInt(String s) {
    final roman = {
      'I': 1,
      'V': 5,
      'X': 10,
      'L': 50,
      'C': 100,
      'D': 500,
      'M': 1000,
    };

    int result = 0;
    int last = 0;

    for (int i = s.length - 1; i >= 0; i--) {
      final current = roman[s[i]]!;
      if (current < last) {
        result -= current;
      } else {
        result += current;
      }
      last = current;
    }
    return result;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.romanToInt("MCMXCIV"));
}
