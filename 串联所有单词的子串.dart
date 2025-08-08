import 'dart:collection';

class Solution {
  List<int> findSubstring(String s, List<String> words) {
    final n = words[0].length;
    final m = words.length;
    final totalLen = m * n;
    final ls = s.length;
    if (ls < totalLen) return [];

    final res = <int>[];

    for (int start = 0; start <= ls - totalLen; start++) {
      final differ = HashMap<String, int>();

      for (int j = 0; j < m; j++) {
        final word = s.substring(start + j * n, start + j * n + n);
        differ[word] = (differ[word] ?? 0) + 1;
      }

      for (final word in words) {
        differ[word] = (differ[word] ?? 0) - 1;
        if (differ[word] == 0) differ.remove(word);
      }

      if (differ.isEmpty) {
        res.add(start);
      }
    }

    return res;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.findSubstring("barfoothefoobarman", ["foo", "bar"]));
}
