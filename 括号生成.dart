class Solution {
  List<String> generateParenthesis(int n) {
    final result = <String>[];
    _generate(n, n, '', result);
    return result;
  }

  void _generate(int open, int close, String current, List<String> result) {
    if (open == 0 && close == 0) {
      result.add(current);
      return;
    }

    // 优先增加嵌套（开括号）
    if (open > 0) {
      _generate(open - 1, close, '$current(', result);
    }

    // 当有未匹配的开括号时添加闭括号
    if (close > open) {
      _generate(open, close - 1, '$current)', result);
    }
  }
}

void main() {
  Solution solution = Solution();
  print(solution.generateParenthesis(5));
}
