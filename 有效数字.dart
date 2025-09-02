class Solution {
  bool isNumber(String s) {
    // 定义字符类型
    String getCharType(String ch) {
      if (ch == ' ' || ch == '\t') return 'space';
      if (ch == '+' || ch == '-') return 'sign';
      if (ch == '.') return 'dot';
      if (ch == 'e' || ch == 'E') return 'exp';
      try {
        int start = int.parse(ch);
        if (start >= 0 && start <= 9) return 'digit';
      }catch(e) {
        return 'unknown';
      }
      return 'unknown';
    }

    // 状态转移表
    const Map<int, Map<String, int>> transfer = {
      0: {'space': 0, 'sign': 1, 'digit': 2, 'dot': 3},
      1: {'digit': 2, 'dot': 3},
      2: {'digit': 2, 'dot': 4, 'exp': 6, 'space': 9},
      3: {'digit': 5},
      4: {'digit': 5, 'exp': 6, 'space': 9},
      5: {'digit': 5, 'exp': 6, 'space': 9},
      6: {'sign': 7, 'digit': 8},
      7: {'digit': 8},
      8: {'digit': 8, 'space': 9},
      9: {'space': 9},
    };

    int state = 0;
    for (int i = 0; i < s.length; i++) {
      String type = getCharType(s[i]);
      if (!transfer[state]!.containsKey(type)) {
        return false;
      }
      state = transfer[state]![type]!;
    }

    // 可接受的结束状态
    return [2, 4, 5, 8, 9].contains(state);
  }
}
