class Solution {
  String convert(String s, int numRows) {
    if (numRows == 1) return s;
    List<List<String>> list = List.generate(numRows, (_) => []);
    int index = 0;
    int step = 1;

    for (int i = 0; i < s.length; i++) {
      list[index].add(s[i]);
      index += step;
      if (index == 0 || index == numRows - 1) {
        step = -step;
      }
    }
    return list.expand((row) => row).join('');
  }
}

void main() {
  Solution solution = Solution();
  print(solution.convert("PAYPALISHIRING", 3));
  print(solution.convert('AB', 1));
}
