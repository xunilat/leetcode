String longestPalindrome(String s) {
  if (s.isEmpty) return "";
  
  int start = 0, max_len = 1;

  void expand(int left, int right) {
    while (left >= 0 && right < s.length && s[left] == s[right]) {
      final currentLength = right - left + 1;
      if (currentLength > max_len) {
        max_len = currentLength;
        start = left;
      }
      left--;
      right++;
    }
  }

  for (int i = 0; i < s.length; i++) {
    expand(i, i);  
    expand(i, i + 1); 
  }

  return s.substring(start, start + max_len);
}

void main() {
  print(longestPalindrome("abb"));    // 正确输出 "bb"
  print(longestPalindrome("babad"));  // 输出 "bab"或"aba"
  print(longestPalindrome("cbbd"));   // 输出 "bb"
  print(longestPalindrome("a"));      // 输出 "a"
  print(longestPalindrome("ac"));     // 输出 "a"或"c"
  print(longestPalindrome("aaaa"));   // 输出 "aaaa"
}