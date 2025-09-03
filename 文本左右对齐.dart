class Solution {
  List<String> fullJustify(List<String> words, int maxWidth) {
    List<String> result = [];
    int index = 0;
    int n = words.length;
    
    while (index < n) {
      // 找到当前行可以放置的单词
      int totalChars = words[index].length;
      int last = index + 1;
      
      while (last < n) {
        // 尝试添加下一个单词，需要至少一个空格
        if (totalChars + 1 + words[last].length > maxWidth) break;
        totalChars += 1 + words[last].length;
        last++;
      }
      
      // 构建当前行
      StringBuffer line = StringBuffer();
      int gapCount = last - index - 1;
      
      // 如果是最后一行或只有一个单词，左对齐
      if (last == n || gapCount == 0) {
        for (int i = index; i < last; i++) {
          line.write(words[i]);
          if (i < last - 1) line.write(' ');
        }
        
        // 填充剩余空格
        for (int i = totalChars; i < maxWidth; i++) {
          line.write(' ');
        }
      } else {
        // 计算空格分布
        int totalSpaces = maxWidth - totalChars + gapCount;
        int spacePerGap = totalSpaces ~/ gapCount;
        int extraSpaces = totalSpaces % gapCount;
        
        for (int i = index; i < last; i++) {
          line.write(words[i]);
          
          if (i < last - 1) {
            // 添加基本空格
            for (int j = 0; j < spacePerGap; j++) {
              line.write(' ');
            }
            
            // 分配额外空格
            if (extraSpaces > 0) {
              line.write(' ');
              extraSpaces--;
            }
          }
        }
      }
      
      result.add(line.toString());
      index = last;
    }
    
    return result;
  }
}

void main() {
  Solution solution = Solution();
  
  // 测试用例
  List<String> words = ["This", "is", "an", "example", "of", "text", "justification."];
  int maxWidth = 16;
  
  List<String> result = solution.fullJustify(words, maxWidth);
  
  for (String line in result) {
    print('"$line"');
  }
}