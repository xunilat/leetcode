class Solution {
  int strStr(String haystack, String needle) {
    if (needle.isEmpty) return 0;

    final n = haystack.length;
    final m = needle.length;
    if (m > n) return -1;

    // 构建部分匹配表（LPS）
    final lps = List.filled(m, 0);
    var len = 0;
    var i = 1;

    while (i < m) {
      if (needle[i] == needle[len]) {
        lps[i++] = ++len;
      } else {
        if (len != 0) {
          len = lps[len - 1];
        } else {
          lps[i++] = 0;
        }
      }
    }

    // KMP 搜索
    var j = 0; // needle 指针
    i = 0; // haystack 指针

    while (i < n) {
      if (haystack[i] == needle[j]) {
        i++;
        j++;
        if (j == m) return i - j; // 找到匹配
      } else {
        if (j > 0) {
          j = lps[j - 1]; // 根据 LPS 回退
        } else {
          i++;
        }
      }
    }

    return -1;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.strStr("haystack", "stack"));
}
