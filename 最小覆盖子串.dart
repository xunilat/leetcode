class Solution {
  String minWindow(String s, String t) {
    if (s.isEmpty || t.isEmpty) return "";
    
    // 记录 t 中每个字符的出现次数
    Map<String, int> targetCount = {};
    for (int i = 0; i < t.length; i++) {
      String char = t[i];
      targetCount[char] = (targetCount[char] ?? 0) + 1;
    }
    
    // 记录窗口中每个字符的出现次数
    Map<String, int> windowCount = {};
    
    // 记录窗口中满足目标字符数量的字符种类数
    int formed = 0;
    int required = targetCount.length;
    
    // 滑动窗口指针和结果变量
    int left = 0, right = 0;
    int minLength = -1, start = 0;
    
    while (right < s.length) {
      // 添加右指针指向的字符到窗口
      String char = s[right];
      windowCount[char] = (windowCount[char] ?? 0) + 1;
      
      // 如果当前字符在目标中，且窗口中该字符数量等于目标中该字符数量
      if (targetCount.containsKey(char) && windowCount[char] == targetCount[char]) {
        formed++;
      }
      
      // 当窗口满足条件时，尝试收缩左指针
      while (left <= right && formed == required) {
        // 更新最小窗口
        if (minLength == -1 || right - left + 1 < minLength) {
          minLength = right - left + 1;
          start = left;
        }
        
        // 移除左指针指向的字符
        String leftChar = s[left];
        windowCount[leftChar] = windowCount[leftChar]! - 1;
        
        // 如果移除后不满足条件，更新 formed
        if (targetCount.containsKey(leftChar) && windowCount[leftChar]! < targetCount[leftChar]!) {
          formed--;
        }
        
        // 移动左指针
        left++;
      }
      
      // 移动右指针
      right++;
    }
    
    return minLength == -1 ? "" : s.substring(start, start + minLength);
  }
}

void main() {
  Solution solution = Solution();
  print(solution.minWindow("ADOBECODEBANC", "ABC")); // 输出: "BANC"
  print(solution.minWindow("a", "a")); // 输出: "a"
  print(solution.minWindow("a", "aa")); // 输出: ""
}