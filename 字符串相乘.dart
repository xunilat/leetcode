class Solution {
  String multiply(String num1, String num2) {
    if (num1 == '0' || num2 == '0') return '0';

    int n1 = num1.length, n2 = num2.length;
    List<int> result = List.filled(n1 + n2, 0);
    for (int i = 0; i < n1; i++) {
      int x = num1.codeUnitAt(i) - '0'.codeUnitAt(0);
      for (int j = 0; j < n2; j++) {
        int y = num2.codeUnitAt(j) - '0'.codeUnitAt(0);
        result[i + j + 1] += x * y;
      }
    }
    for (int i = result.length - 1; i > 0; i--) {
      result[i - 1] += result[i] ~/ 10;
      result[i] = result[i] % 10;
    }
    StringBuffer sb = StringBuffer();
    for (int i = result[0] == 0 ? 1 : 0; i < result.length; i++) {
      sb.write(result[i]);
    }
    return sb.toString();
  }
}

void main() {
  Solution solution = Solution();
  print(solution.multiply('2', '3'));
  print(solution.multiply('0', '0'));
  print(solution.multiply('123', '456'));
}
