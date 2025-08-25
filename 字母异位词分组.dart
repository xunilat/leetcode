import 'dart:collection';

class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    Map<String, List<String>> map = HashMap<String, List<String>>();
    for (String str in strs) {
      List<String> charList = str.split('');
      charList.sort();
      String key = charList.toString();
      List<String> list = map[key] ?? [];
      list.add(str);
      map[key] = list;
    }
    return List.from(map.values);
  }
}

void main() {
  Solution solution = Solution();
  print(solution.groupAnagrams(['eat', 'tea', 'tan', 'ate', 'nat', 'bat']));
  print(solution.groupAnagrams(['a', 'a', 'a']));
}
