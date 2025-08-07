class Solution {
  int myAtoi(String s) {
    s = s.trim();
    if (s.isEmpty) return 0;
    int index = 0;
    int sige = 1;
    if (s[0] == '+' || s[0] == '-') {
      sige = s[0] == '-' ? -1 : 1;
      index = 1;
    }
    List<String> list = [];
    for (int i = index; i < s.length; i++) {
      if (s.codeUnitAt(i) >= 48 && s.codeUnitAt(i) <= 57) {
        list.add(s[i]);
      } else {
        break;
      }
    }
    if (list.isEmpty) return 0;
    const max = '2147483647';
    const min = '2147483648';
    String num_str = list.join();
    int start = 0;
    while (num_str[start] == '0') {
      start++;
    }
    num_str = num_str.substring(start);
    if (num_str.isEmpty) return 0;
    if (sige == 1) {
      if (num_str.length > 10 ||
          (num_str.length == 10 && num_str.compareTo(max) > 0)) {
        return int.parse(max);
      }
    } else {
      if (num_str.length > 10 ||
          (num_str.length == 10 && num_str.compareTo(min) > 0)) {
        return int.parse(min) * (-1);
      }
    }
    return sige * int.parse(num_str);
  }
}