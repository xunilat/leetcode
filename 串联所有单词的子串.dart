import 'dart:collection';

class Solution {
  List<int> findSubstring(String s, List<String> words) {
    
    final n = words[0].length;
    final m = words.length;
    final totalLen = m * n;
    final ls = s.length;
    if (ls < totalLen) return [];

    final res = <int>[];
    
    for (int i = 0; i < n; i++) {
      if (i + totalLen > ls) break;
      
      final differ = HashMap<String, int>();
      
      // 初始化窗口
      for (int j = 0; j < m; j++) {
        final word = s.substring(i + j * n, i + (j + 1) * n);
        differ[word] = (differ[word] ?? 0) + 1;
      }
      
      // 创建差异
      for (final word in words) {
        differ[word] = (differ[word] ?? 0) - 1;
        if (differ[word] == 0) differ.remove(word);
      }
      
      // 滑动窗口
      for (int start = i; start <= ls - totalLen; start += n) {
        if (start != i) {
          // 添加新单词（右边界）
          final newWord = s.substring(start + totalLen - n, start + totalLen);
          differ[newWord] = (differ[newWord] ?? 0) + 1;
          if (differ[newWord] == 0) differ.remove(newWord);
          
          // 移除旧单词（左边界）
          final oldWord = s.substring(start - n, start);
          differ[oldWord] = (differ[oldWord] ?? 0) - 1;
          if (differ[oldWord] == 0) differ.remove(oldWord);
        }
        
        if (differ.isEmpty) res.add(start);
      }
    }
    
    return res;
  }
}