class Solution {
  bool isValid(String s) {
    if (s.length.isOdd) return false;
    List<String> stack = [];
    for (int i = 0; i < s.length; i++) {
      switch (s[i]) {
        case '(':
        case '[':
        case '{':
          stack.add(s[i]);
          break;
        case ')':
          if (stack.isNotEmpty && stack.last == '(') {
            stack.removeLast();
          } else {
            return false;
          }
          break;
        case ']':
          if (stack.isNotEmpty && stack.last == '[') {
            stack.removeLast();
          } else {
            return false;
          }
          break;
        case '}':
          if (stack.isNotEmpty && stack.last == '{') {
            stack.removeLast();
          } else {
            return false;
          }
          break;
      }
    }
    return stack.isEmpty;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.isValid("[]{}}{"));
}
