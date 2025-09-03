class Solution {
  String addBinary(String a, String b) {
    StringBuffer sb = StringBuffer();
    int bit = 0;
    for (int i = a.length - 1, j = b.length - 1; i >= 0 || j >= 0; i--, j--) {
      int sum = bit;
      sum += i >= 0 ? a[i].codeUnits[0] - '0'.codeUnits[0] : 0;
      sum += j >= 0 ? b[j].codeUnits[0] - '0'.codeUnits[0] : 0;
      sb.write(sum % 2);
      bit = sum ~/ 2;
    }
    sb.write(bit == 1 ? bit : '');
    return sb.toString().split('').reversed.join();
  }
}

void main() {
  Solution solution = Solution();
  print(solution.addBinary('11', '1'));
}
