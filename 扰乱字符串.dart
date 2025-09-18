class Solution {
  bool isScramble(String s1, String s2) {
    if (s1.length != s2.length) return false;
    if (s1 == s2) return true;
    
    int n = s1.length;
    // 备忘录，避免重复计算
    Map<String, bool> memo = {};
    
    return _dfs(s1, s2, 0, n - 1, 0, n - 1, memo);
  }
  
  bool _dfs(String s1, String s2, int start1, int end1, int start2, int end2, Map<String, bool> memo) {
    String key = '$start1-$end1-$start2-$end2';
    if (memo.containsKey(key)) return memo[key]!;
    
    // 基本情况：单个字符比较
    if (start1 == end1) {
      bool result = s1[start1] == s2[start2];
      memo[key] = result;
      return result;
    }
    
    // 剪枝：检查字符频率是否相同
    if (!_isAnagram(s1, s2, start1, end1, start2, end2)) {
      memo[key] = false;
      return false;
    }
    
    int length = end1 - start1 + 1;
    
    // 尝试所有可能的分割点
    for (int i = 0; i < length - 1; i++) {
      // 情况1：不交换的情况
      if (_dfs(s1, s2, start1, start1 + i, start2, start2 + i, memo) &&
          _dfs(s1, s2, start1 + i + 1, end1, start2 + i + 1, end2, memo)) {
        memo[key] = true;
        return true;
      }
      
      // 情况2：交换的情况
      if (_dfs(s1, s2, start1, start1 + i, end2 - i, end2, memo) &&
          _dfs(s1, s2, start1 + i + 1, end1, start2, end2 - i - 1, memo)) {
        memo[key] = true;
        return true;
      }
    }
    
    memo[key] = false;
    return false;
  }
  
  // 检查两个子串是否是字母异位词（字符频率相同）
  bool _isAnagram(String s1, String s2, int start1, int end1, int start2, int end2) {
    List<int> count = List.filled(26, 0);
    int length = end1 - start1 + 1;
    
    for (int i = 0; i < length; i++) {
      count[s1.codeUnitAt(start1 + i) - 'a'.codeUnitAt(0)]++;
      count[s2.codeUnitAt(start2 + i) - 'a'.codeUnitAt(0)]--;
    }
    
    for (int i = 0; i < 26; i++) {
      if (count[i] != 0) return false;
    }
    
    return true;
  }
}