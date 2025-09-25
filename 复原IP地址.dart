class Solution {
  List<String> restoreIpAddresses(String s) {
    List<String> result = [];
    
    void dfs(String s, int start, int parts, String ip) {
      if (parts == 4) {
        if (start == s.length) result.add(ip);
        return;
      }
      
      for (int i = 1; i <= 3; i++) {
        if (start + i > s.length) break;
        
        String segment = s.substring(start, start + i);
        
        // 有效性检查：不以0开头（除非是单个0），且在0-255范围内
        if ((segment.length > 1 && segment[0] == '0') || 
            int.parse(segment) > 255) continue;
            
        dfs(s, start + i, parts + 1, 
            parts == 0 ? segment : ip + '.' + segment);
      }
    }
    
    if (s.length >= 4 && s.length <= 12) {
      dfs(s, 0, 0, '');
    }
    
    return result;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.restoreIpAddresses('10101010'));
}