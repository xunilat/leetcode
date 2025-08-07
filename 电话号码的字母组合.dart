class Solution {
  List<String> letterCombinations(String digits) {
    if (digits.isEmpty) return [];

    const digitToLetters = {
      '2': 'abc',
      '3': 'def',
      '4': 'ghi',
      '5': 'jkl',
      '6': 'mno',
      '7': 'pqrs',
      '8': 'tuv',
      '9': 'wxyz',
    };

    List<String> result = [''];

    for (int i = 0; i < digits.length; i++) {
      final letters = digitToLetters[digits[i]]!;
      final temp = <String>[];

      for (final str in result) {
        for (final letter in letters.runes) {
          temp.add(str + String.fromCharCode(letter));
        }
      }

      result = temp;
    }

    return result;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.letterCombinations("23"));
}
