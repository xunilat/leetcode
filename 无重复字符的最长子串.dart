import 'dart:collection';
import 'dart:math';

class Solution {
  int lengthOfLongestSubstring(String s) {
    int length = 0;
    Queue<String> queue = Queue();
    for (String str in s.split('')) {
      while (queue.contains(str)) {
        queue.removeFirst();
      }
      queue.add(str);
      length = max(length, queue.length);
    }
    return length;
  }
}
