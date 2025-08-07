class Solution {
  String intToRoman(int num) {
    if (num < 1 || num > 3999) return '';

    final values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];
    final symbols = [
      "M",
      "CM",
      "D",
      "CD",
      "C",
      "XC",
      "L",
      "XL",
      "X",
      "IX",
      "V",
      "IV",
      "I",
    ];

    final result = StringBuffer();
    int i = 0;

    while (num > 0) {
      if (num >= values[i]) {
        result.write(symbols[i]);
        num -= values[i];
      } else {
        i++;
      }
    }

    return result.toString();
  }
}

void main() {
  var roman = Solution();
  print(roman.intToRoman(3)); // III
  print(roman.intToRoman(4)); // IV
  print(roman.intToRoman(9)); // IX
  print(roman.intToRoman(58)); // LVIII
  print(roman.intToRoman(1994)); // MCMXCIV
}
